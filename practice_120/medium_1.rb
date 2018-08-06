# ------------------------------------
# Privacy
# ------------------------------------

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   def inspect 
#     get_switch_state
#   end

#   private

#   attr_accessor :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end

#   def get_switch_state
#     switch
#   end
# end



# # TESTING

# blender = Machine.new
# blender.start
# p blender.inspect
# blender.stop
# # p blender.get_switch_state # Error














# ------------------------------------------------
# Fixed Array
# ------------------------------------------------

# class FixedArray
#   def initialize(num)
#     @array = Array.new(num) { |index| nil }
#   end

#   def [](index)
#     (1..@array.size).include?(index.abs) ? @array[index] : raise(IndexError)
#   end

#   def []=(index, value)
#     (1..@array.size).include?(index.abs) ? @array[index] : raise(IndexError)
#     @array[index] = value
#   end

#   def to_a
#     @array.clone
#   end

#   def to_s
#     @array.clone.inspect
#   end
# end



# # TESTING

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   p fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end













# ------------------------------------------------
# Students
# ------------------------------------------------

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     @parking = parking
#     super(name, year)
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end













# ------------------------------------------------
# Circular Queue
# ------------------------------------------------

# class CircularQueue
#   def initialize(size)
#     @queue = Array.new(size)
#     @history = []
#     size.times { |num| @history[num] = [num, nil] }
#   end

#   def enqueue(obj)
#     empty_position = @queue.index(nil)
#     oldest_obj = @history[0][1]
#     oldest_obj_position = @history[0][0]

#     if oldest_obj == nil
#       add_to_history(oldest_obj_position, obj)
#       remove_from_history(0)
#       update_queue(oldest_obj_position, obj)
#     elsif empty_position 
#       add_to_history(empty_position, obj)
#       update_queue(empty_position, obj)
#     else
#       add_to_history(oldest_obj_position, obj)
#       remove_from_history(0)
#       update_queue(oldest_obj_position, obj)
#     end
#   end

#   def dequeue
#     return nil if @queue.all? { |obj| obj == nil }

#     if @queue.include?(nil)
#       oldest_obj_position = find_oldest_num[0]
#       oldest_obj = find_oldest_num
#     else
#       oldest_obj_position = @history[0][0]
#       oldest_obj = @history[0]
#     end
#     oldest_index = @history.index(oldest_obj)
#     update_queue(oldest_obj_position, nil)
#     remove_from_history(oldest_index)[1]
#   end

#   private

#   def add_to_history(position, obj)
#     @history << [position, obj]
#   end

#   def remove_from_history(index)
#     @history.delete(@history[index])
#   end

#   def update_queue(position, new_obj)
#     @queue[position] = new_obj
#   end

#   def find_oldest_num
#     all_nums = @history.select do |array| 
#       array[1].class == Fixnum 
#     end
#     all_nums.first
#   end
# end




# # TESTING

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1 

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil















# ------------------------------------------------
# Stack Machine Interpretation
# ------------------------------------------------

# class Minilang
#   def initialize(math_problem)
#     @ops = math_problem.split
#     @register = 0
#     @stack = []
#   end

#   def eval
#     @ops.each do |op|
#       if op.to_i.to_s == op 
#         @register = op.to_i 
#       else
#         begin
#           send(op)
#         rescue NoMethodError
#           puts "Invalid Token: " + op
#           exit
#         end
#       end
#       raise EmptyStackError if @register == nil
#     end
#   end

#   private

#   def PUSH
#     @stack << @register 
#   end

#   def ADD
#     @register += @stack.pop
#   end

#   def SUB
#     @register -= @stack.pop 
#   end

#   def MULT
#     @register *= @stack.pop
#   end

#   def DIV
#     @register /= @stack.pop 
#   end

#   def MOD
#     @register %= @stack.pop 
#   end

#   def POP
#     @register = @stack.shift
#   end

#   def PRINT
#     puts @register
#   end

#   class EmptyStackError < RuntimeError
#     def initialize
#       print_message
#       exit
#     end
    
#     def print_message
#       puts 'Empty stack!'
#     end
#   end
# end



# # TESTING

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# # Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# # Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)
















# --------------------------------------
# Further Exploration - Modification
# --------------------------------------

# class Minilang
#   def initialize(math_problem)
#     @ops = math_problem
#     @register = 0
#     @stack = []
#   end

#   def eval(num_to_convert)
#     ops_copy = @ops.clone
#     formatted_ops = (format(ops_copy, num_to_convert))
#     formatted_ops.split.each do |op|
#       if op.to_i.to_s == op 
#         @register = op.to_i 
#       else
#         begin
#           send(op)
#         rescue NoMethodError
#           puts "Invalid Token: " + op
#           exit
#         end
#       end
#       raise EmptyStackError if @register == nil
#     end
#   end

#   private

#   def PUSH
#     @stack << @register 
#   end

#   def ADD
#     @register += @stack.pop
#   end

#   def SUB
#     @register -= @stack.pop 
#   end

#   def MULT
#     @register *= @stack.pop
#   end

#   def DIV
#     @register /= @stack.pop 
#   end

#   def MOD
#     @register %= @stack.pop 
#   end

#   def POP
#     @register = @stack.shift
#   end

#   def PRINT
#     puts @register
#   end

#   class EmptyStackError < RuntimeError
#     def initialize
#       print_message
#       exit
#     end
    
#     def print_message
#       puts 'Empty stack!'
#     end
#   end
# end




# # TESTING

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40

# FAHRENHEIT_TO_CENTIGRADE =
#   '9 PUSH 32 PUSH %<degrees_f>d SUB PUSH 5 MULT DIV PRINT'
# minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
# minilang.eval(degrees_f: 212)
# # 100
# minilang.eval(degrees_f: 32)
# # 0
# minilang.eval(degrees_f: -40)
# # -40


# MPH_TO_KPH =
#   '3 PUSH %<distance_m>d DIV PUSH 5 MULT PRINT'
# minilang = Minilang.new(MPH_TO_KPH)
# minilang.eval(distance_m: 9)
# # 15
# minilang.eval(distance_m: 60)
# # 100
# minilang.eval(distance_m: 102)
# # 170















# --------------------------------------
# Further Exploration - Two inputs
# --------------------------------------

# require 'pry'

# class Minilang
#   def initialize(math_problem)
#     @ops = math_problem
#     @register = 0
#     @stack = []
#   end

#   def eval(dimensions)
#     ops_copy = @ops.clone
#     formatted_ops = (format(ops_copy, dimensions))
#     formatted_ops.split.each do |op|
#       if op.to_i.to_s == op 
#         @register = op.to_i 
#       else
#         begin
#           send(op)
#         rescue NoMethodError
#           puts "Invalid Token: " + op
#           exit
#         end
#       end
#       raise EmptyStackError if @register == nil
#     end
#   end

#   private

#   def PUSH
#     @stack << @register 
#   end

#   def ADD
#     @register += @stack.pop
#   end

#   def SUB
#     @register -= @stack.pop 
#   end

#   def MULT
#     @register *= @stack.pop
#   end

#   def DIV
#     @register /= @stack.pop 
#   end

#   def MOD
#     @register %= @stack.pop 
#   end

#   def POP
#     @register = @stack.shift
#   end

#   def PRINT
#     puts @register
#   end

#   class EmptyStackError < RuntimeError
#     def initialize
#       print_message
#       exit
#     end
    
#     def print_message
#       puts 'Empty stack!'
#     end
#   end
# end


# # TESTING

# AREA = '%<width>d PUSH %<height>d MULT PRINT'
# minilang = Minilang.new(AREA)
# minilang.eval(width: 5, height: 5)
# 25
# minilang.eval(width: 10, height: 3)
# # 30
# minilang.eval(width: 100, height: 90)
# # 9000














# ------------------------------------
# Number Guesser Part 1
# ------------------------------------

# class PingGame
#   def initialize
#     @chances
#     @number
#     @guess
#   end

#   def play
#     start
#     loop do
#       display_chances_left
#       get_guess
#       @chances -= 1
#       display_result
#       return if end_of_game
#     end
#   end

#   private 

# def start
#   @chances = 7
#   @number = (1..100).to_a.sample
# end

#   def display_result
#     puts "Your guess is too #{high_or_low}." if high_or_low
#     puts end_of_game if player_won || player_lost
#   end

#   def end_of_game
#     if player_lost then 'You are out of guesses. You lose.'
#     elsif player_won then 'You won!' 
#     else nil
#     end
#   end

#   def get_guess
#     loop do 
#       print 'Enter a number between 1 and 100: '
#       @guess = gets.chomp.to_i
#       break if (1..100).include?(@guess)
#       print 'Invalid guess. '
#     end
#   end

#   def display_chances_left
#     if @chances == 1
#       puts "\nYou have #{@chances} guess remaining."
#     else
#       puts "\nYou have #{@chances} guesses remaining."
#     end
#   end

#   def high_or_low
#     if @guess > @number then 'high'
#     elsif @guess < @number then 'low'
#     else nil
#     end
#   end

#   def player_lost
#     @chances == 0
#   end

#   def player_won
#     @guess == @number
#   end
# end



# # TESTING

# game = PingGame.new
# game.play
# game.play

# # You have 7 guesses remaining.
# # Enter a number between 1 and 100: 104
# # Invalid guess. Enter a number between 1 and 100: 50
# # Your guess is too low

















# ------------------------------------
# Number Guesser Part 2
# ------------------------------------

# class Guesser
#   def initialize(low, high)
#     @low = low
#     @high = high
#     @range = @low..@high
#   end

#   def play
#     start
#     loop do
#       display_chances_left
#       get_guess
#       @chances -= 1
#       display_result
#       return if end_of_game
#     end
#   end

#   private 

#   def start
#     @chances = Math.log2(@range.size).to_i + 1
#     @number = (@range).to_a.sample
#   end

#   def display_result
#     puts "Your guess is too #{high_or_low}." if high_or_low
#     puts end_of_game if player_won || player_lost
#   end

#   def end_of_game
#     if player_lost then 'You are out of guesses. You lose.'
#     elsif player_won then 'You won!' 
#     else nil
#     end
#   end

#   def get_guess
#     loop do 
#       print "Enter a number between #{@low} and #{@high}: "
#       @guess = gets.chomp.to_i
#       break if (@low..@high).cover?(@guess)
#       print 'Invalid guess. '
#     end
#   end

#   def display_chances_left
#     if @chances == 1
#       puts "\nYou have #{@chances} guess remaining."
#     else
#       puts "\nYou have #{@chances} guesses remaining."
#     end
#   end

#   def high_or_low
#     if @guess > @number then 'high'
#     elsif @guess < @number then 'low'
#     else nil
#     end
#   end

#   def player_lost
#     @chances == 0
#   end

#   def player_won
#     @guess == @number
#   end
# end


# # TESTING

# game = Guesser.new(150, 175)
# game.play
# game.play

















# ------------------------------------
# Highest and Lowest Ranking Cards
# ------------------------------------

# class Card
#   attr_reader :rank, :suit, :value

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#     set_value
#   end

#   private

#   def set_value
#     case rank
#     when 'Ace' then @value = 14
#     when 'King' then @value = 13
#     when 'Queen' then @value = 12
#     when 'Jack' then @value = 11
#     else @value = rank
#     end
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   protected

#   def <=>(other)
#     self.value <=> other.value
#   end
# end



# # TESTING

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min #== Card.new(2, 'Hearts')
# puts cards.max #== Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min #== Card.new(5, 'Hearts')
# puts cards.max #== Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank #== 4
# puts cards.max #== Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min #== Card.new(7, 'Diamonds')
# puts cards.max.rank #== 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank #== 8
# puts cards.max.rank #== 8













# ------------------------------------
# Further Exploration
# ------------------------------------


# class Card
#   attr_reader :rank, :suit, :value, :suit_order

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#     set_value
#     set_suit_order
#   end

#   private

#   def set_suit_order
#     case suit
#     when 'Spades' then @suit_order = 4
#     when 'Hearts' then @suit_order = 3
#     when 'Clubs' then @suit_order = 2
#     else @suit_order = 1
#     end
#   end

#   def set_value
#     case rank
#     when 'Ace' then @value = 14
#     when 'King' then @value = 13
#     when 'Queen' then @value = 12
#     when 'Jack' then @value = 11
#     else @value = rank
#     end
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   protected

#   def <=>(other)
#     if self.value == other.value
#       self.suit_order <=> other.suit_order
#     else
#       self.value <=> other.value
#     end
#   end
# end

# # TESTING

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]

# puts cards.min # 8 of Diamonds
# puts cards.max # 8 of Spades
















# ------------------------------------
# Deck of Cards
# ------------------------------------

# class Card
#   attr_reader :rank, :suit, :value

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#     set_value
#   end

#   private

#   def set_value
#     case rank
#     when 'Ace' then @value = 14
#     when 'King' then @value = 13
#     when 'Queen' then @value = 12
#     when 'Jack' then @value = 11
#     else @value = rank
#     end
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   protected

#   def <=>(other)
#     self.value <=> other.value
#   end
# end


# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze
#   CARD_TYPES = RANKS.product(SUITS)

#   def initialize
#     reset
#   end

#   def draw
#     reset if @cards.empty?
#     @cards.pop
#   end

#   def reset
#     @cards = CARD_TYPES.map do |card|
#       Card.new(card[0], card[1])
#     end
#     @cards.shuffle!
#   end
# end


# # TESTING


# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.













# ------------------------------------ 
# Poker!
# ------------------------------------

require 'pry'

class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    set_value
  end

  private

  def set_value
    case rank
    when 'Ace' then @value = 14
    when 'King' then @value = 13
    when 'Queen' then @value = 12
    when 'Jack' then @value = 11
    else @value = rank
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def <=>(other)
    self.value <=> other.value
  end
end


class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  CARD_TYPES = RANKS.product(SUITS)

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  def reset
    @cards = CARD_TYPES.map do |card|
      Card.new(card[0], card[1])
    end
    @cards.shuffle!
  end
end



class PokerHand
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    card_included?('Ace') &&
    card_included?('King') &&
    card_included?('Queen') &&
    card_included?('Jack') &&
    card_included?(10)
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    rank_totals = count_ranks
    rank_totals.include?(4)
  end

  def full_house?
    rank_totals = count_ranks
    rank_totals.include?(3) && rank_totals.include?(2)
  end

  def flush?
    suits = []
    @hand.each_with_index do |_, index|
      suits << @hand[index].suit
    end
    return true if suits.all? { |suit| suit == suits[0] }
    false
  end

  def straight?
    values = []
    @hand.each_with_index do |_, index|
      values << @hand[index].value
    end
    (values.min..values.max).each do |value|
      return false if !values.include?(value)
    end
    true
  end

  def three_of_a_kind?
    rank_totals = count_ranks
    rank_totals.include?(3)
  end

  def two_pair?
   rank_totals = count_ranks
   rank_totals.count(2) == 4
  end

  def pair?
    rank_totals = count_ranks
    rank_totals.include?(2)
  end

  def card_included?(card_rank)
    @hand.each_with_index do |_, index|
      return true if @hand[index].rank == card_rank
    end
    false
  end

  def count_ranks
    ranks = []
    @hand.each_with_index do |_, index|
      ranks << @hand[index].rank
    end
    ranks.map { |rank| ranks.count(rank) }
  end
end



# TESTING

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'


# ------------------------------------
# Further Exploration
# ------------------------------------


# A. Modify for public class methods:
# => The biggest difference is that all the orchestration that currently occurs in the evaluate method would be moved outside the PokerHand class.


# B. Best Hand:
# => Make a new class called PokerGame
# => Create a constant WINNING_HANDS that is a hash that hold the name of the hand and a value highest card = min and royal flush = max
# => Intialize two hands (player1_hand and player2_hand)
# => Create a public method determine_winner
# => Within this method you would determine which hand is greater by referencing the WINNING_HANDS constant.


# C. Best 5-card hand from 7 cards:
# => I would have to alter the individual hand methods to account for looking through 7 cards instead of 5.

