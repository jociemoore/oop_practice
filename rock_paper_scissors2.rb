# --------------------
# Textual Description:
# --------------------
# Rock, Paper, Scissors is a two-player game where each player chooses one of the three possible moves: rock, paper, or scissors. The chosen move will then be compares to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# --------------------
# Noun/Verb Extraction:
# --------------------

# NOUNS: player, move, rule
# VERBS: choose, compare


# -------------------------
# Organizing Nouns & Verbs:
# -------------------------

# Player
# - choose

# Move
# Rule

# - compare

# -------------------------
# Game Orchestration Engine
# -------------------------

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts " Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    puts "Please choose rock, paper, or scissors:"
    choice = nil
    loop do
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? choice
      puts "Sorry, invalid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sarah', 'Beth'].sample 
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end

end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

   def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
        puts "It's a tie!" if computer.move == 'rock'
        puts "#{human.name} won!" if computer.move == 'scissors'
        puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
        puts "It's a tie!" if computer.move == 'paper'
        puts "#{human.name} won!" if computer.move == 'rock'
        puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
        puts "It's a tie!" if computer.move == 'scissors'
        puts "#{human.name} won!" if computer.move == 'paper'
        puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do 
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be 'y' or 'n'."
    end

    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end


RPSGame.new.play


# This design is better than the first because there is less redudant code of the human/computer conditional that handles the player type. This design is "DRY-er". One drawback of this new design is that the Human and Computer classes cannot have any additional super classes if that was needed.