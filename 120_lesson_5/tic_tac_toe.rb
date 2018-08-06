class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?(mark)
    !!winning_marker(mark)
  end

  def count_marker(squares, mark)
    squares.collect(&:marker).count(mark)
  end

  # returns winning marker or nil
  def winning_marker(marker)
    WINNING_LINES.each do |line|
      if count_marker(@squares.values_at(*line), marker) == 3
        return marker
      end
    end
    nil
  end

  def reset
    (1..9).each do |key|
      @squares[key] = Square.new
    end
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
end
# rubocop:enable Metrics/AbcSize

class Square
  INITIAL_MARKER = " ".freeze
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  HUMAN_FIRST = true
  attr_accessor :human_turn
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @human_turn = HUMAN_FIRST
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You are a #{human.marker}. Computer is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.human_turn = false
    else
      computer_moves
      self.human_turn = true
    end
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def human_turn?
    @human_turn
  end

  def display_result
    clear_screen_and_display_board
    if board.winning_marker(HUMAN_MARKER)
      puts "You won!"
    elsif board.winning_marker(COMPUTER_MARKER)
      puts "Computer won!"
    else
      puts "Its a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    clear
    self.human_turn = HUMAN_FIRST
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  public

  def play
    display_welcome_message
    clear
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won?(HUMAN_MARKER) ||
                 board.someone_won?(COMPUTER_MARKER) ||
                 board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end
end

# Start the game
game = TTTGame.new
game.play
