# add class for each move

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end
end

class Rock < Move
  def >(other_move)
    other_move == 'scissors' || other_move == 'lizard'
  end

  def <(other_move) 
    other_move == 'spock' || other_move == 'paper'
  end
end

class Paper < Move
  def >(other_move)
    other_move == 'spock' || other_move == 'rock'
  end

  def <(other_move)
    other_move == 'scissors' || other_move == 'lizard'
  end
end

class Scissors < Move
  def >(other_move)
    other_move == 'lizard' || other_move == 'paper'
  end

  def <(other_move)
    other_move == 'spock' || other_move == 'rock'
  end
end

class Lizard < Move
  def >(other_move)
    other_move == 'paper' || other_move == 'spock'
  end

  def <(other_move)
    other_move == 'rock' || other_move == 'scissors'
  end
end

class Spock < Move
  def >(other_move)
    other_move == 'rock' || other_move == 'scissors'
  end

  def <(other_move)
    other_move == 'paper' || other_move == 'lizard'
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    self.score = 0
  end

  def increase_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "=================="
      print "Please introduce yourself to your opponent. \nWhat is your name: "
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    puts "=================="
    puts "#{name}, please choose rock, paper, scissors, lizard, or spock:"
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end

end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sarah', 'Beth'].sample
    puts "You will be playing against #{name}."
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @@game_over = false
  end

  def display_moves
    puts "--------"
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts "--------"
  end

  def display_winner
      if get_result(human.move.to_s) > computer.move.to_s
        puts "#{human.name} won!"
        human.increase_score
      elsif get_result(human.move.to_s) < computer.move.to_s
        puts "#{computer.name} won!"
        computer.increase_score
      else
        puts "It's a tie!"
      end
    display_scoreboard
  end

  def display_scoreboard
    puts "--------"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts "--------"
    if human.score == 3
      puts "#{human.name} won 'Best of Three'."
      @@game_over = true
    elsif computer.score == 3
      puts "#{computer.name} won 'Best of Three'."
      @@game_over = true
    end
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if @@game_over
      play_again?
    end
  end
end

def get_result(human_move)
  case human_move
  when 'rock' then Rock.new('rock')
  when 'paper' then Paper.new('paper')
  when 'scissors' then Scissors.new('scissors')
  when 'lizard' then Lizard.new('lizard')
  when 'spock' then Spock.new('spock')
  end
end

def display_welcome_message
  puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
end

def display_goodbye_message
  puts "=================="
  puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  exit
end

def play_again?
  answer = nil
  loop do
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include? answer
    puts "Sorry, must be 'y' or 'n'."
  end

  return true if answer == 'y'
  if answer == 'n'
    display_goodbye_message
  end
end

display_welcome_message
loop do 
  RPSGame.new.play
  break unless play_again?
end

# In the code, the comparison logic moved into each individual move class, a new method called get_result was added, and the values for the comparison statements needed to be accessed differently. As was pointed out in the walk through, having each move be a class is not necessarily intuitive. I felt like I had to hack my way through this one in order to make it work. Nonetheless, the pros of this design is the behaviors for each move type are spearated out. The cons of this design are the > and < methods for each move is repetitive, there is more indirection, and harder to reach code with the added helper method get_result. With such cons, I think the the first design is better.

