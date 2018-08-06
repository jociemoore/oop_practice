
# computer personalities

# => Building off the previous feature which adjusted the computer choice based on the history of moves, I included the computer personalities within the get_options method of the Move_Analysis class. The get_options methods first initializes a few variables: computer_choices, old_moves, and random_luck. The personalities are based on a mix of these values. For each robot personality, certain choices are deleted from the computer_choices array, which is then sampled OR the computer_choices variable is reassigned one value based on the divisibility of the random_luck number. Otherwise, all options are sampled and the value stored in the computer_choices variable. The computer_choices value is returned from the get_options method, which becomes the computer's move.
# R2D2: chooses always rock
# Hal: chooses scissors often, rarely rock, and never paper
# Sarah: chooses lizard often, rarely spock, and never spock
# Chappie: choose lizard never
# Beth: chooses the last move if it was a win


require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def lizard?
    @value =='lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      rock? && other_move.lizard? ||
      scissors? && other_move.lizard? ||
      scissors? && other_move.paper? ||
      lizard? && other_move.paper? ||
      lizard? && other_move.spock? ||
      paper? && other_move.spock? ||
      paper? && other_move.rock? ||
      spock? && other_move.rock? ||
      spock? && other_move.scissors?
  end

  def <(other_move)
    rock? && other_move.spock? ||
      rock? && other_move.paper? ||
      spock? && other_move.paper? ||
      spock? && other_move.lizard? ||
      paper? && other_move.scissors? ||
      paper? && other_move.lizard? ||
      lizard? && other_move.rock? ||
      lizard? && other_move.scissors? ||
      scissors? && other_move.spock? ||
      scissors? && other_move.rock? 
  end

  def to_s
    @value
  end
end

class Move_Analysis
  attr_accessor :history, :chance_rock, :chance_paper, :chance_scissors, :chance_lizard, :chance_spock, :robot_name

  def initialize(history, robot_name)
    @history = history
    @chance_rock = calculate_failure('rock')
    @chance_paper = calculate_failure('paper')
    @chance_scissors = calculate_failure('scissors')
    @chance_lizard = calculate_failure('lizard')
    @chance_spock = calculate_failure('spock')
    @robot_name = robot_name
  end

  def calculate_failure(move_type)
    number_losses = self.history.count(["L", move_type])
    total_moves_by_type = number_losses + self.history.count(["W", move_type])
    if total_moves_by_type > 0 && number_losses.to_f > 0
      number_losses.to_f / total_moves_by_type.to_f
    else
      0
    end
  end

  def get_options
    computer_choices = Move::VALUES.clone
    old_moves = self.history.map { |array| array[1] }
    random_luck = rand(1..10)
    if self.robot_name ==  'R2D2'
      computer_choices = 'rock'
    elsif self.robot_name == 'Hal'
      computer_choices.delete('paper')
      computer_choices.delete('scissors')
      computer_choices.delete('rock')
      computer_choices = computer_choices.sample
    elsif self.robot_name == 'Hal' && random_luck % 2 == 0
      computer_choices = 'scissors'
    elsif self.robot_name == 'Hal' && random_luck % 9 == 0
      computer_choices = 'rock'
    elsif self.robot_name == 'Sarah' 
      computer_choices.delete('spock')
      computer_choices.delete('lizard')
      computer_choices.delete('scissors')
      computer_choices = computer_choices.sample
    elsif self.robot_name == 'Sarah' && random_luck % 3 == 0
      computer_choices = 'lizard'
    elsif self.robot_name == 'Sarah' && random_luck % 10 == 0
      computer_choices = 'spock'
    elsif self.robot_name == 'Chappie'
      computer_choices.delete('lizard')
      computer_choices = computer_choices.sample
    elsif self.robot_name == 'Beth' && 
      self.history.empty? == false &&
      self.history[-1][0] == 'W'
      computer_choices = self.history[-1][1]
    else
      computer_choices = computer_choices.sample
    end
    computer_choices
  end
end

class Player
  attr_accessor :move, :name, :score, :log

  def initialize
    set_name
    @score = 0
    @log = []
  end

  def increase_score
    self.score += 1
  end

  def record_move(win_loss, play)
    self.log << [win_loss, play] 
  end

  def display_history
    puts "\n************************"
    puts "#{self.name}'s History of Moves: "
    self.log.each_with_index do |prev_move, index| 
      puts "#{index + 1}) #{prev_move}"
    end
    puts "************************\n"
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
    print "#{name}, please choose rock, paper, scissors, lizard, or spock: "
    choice = nil
    loop do
      choice = gets.chomp
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
    choice = Move_Analysis.new(self.log, self.name).get_options
    self.move = Move.new(choice)
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
    if human.move > computer.move
      puts "#{human.name} won!"
      human.increase_score
      human.record_move('W', human.move.to_s)
      computer.record_move('L', computer.move.to_s)
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.increase_score
      human.record_move('L', human.move.to_s)
      computer.record_move('W', computer.move.to_s)
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
    if human.score == 10
      puts "#{human.name} won 'Best of Ten'."
      @@game_over = true
    elsif computer.score == 10
      puts "#{computer.name} won 'Best of Ten'."
      @@game_over = true
    end
  end

  def play
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      human.display_history
      computer.display_history
      break if @@game_over
      play_again?
    end
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
  puts "=================="
  loop do
    print "Would you like to play again? (y/n) "
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

