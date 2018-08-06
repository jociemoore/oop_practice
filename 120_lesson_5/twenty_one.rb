module Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total_points
    points = 0
    aces = cards.select { |card| card.face == 'A' }
    aces.each { |card| cards.delete(card) }
    cards.concat(aces) if !aces.empty?
    cards.each do |card|
      points += Card.get_value(card.face, points)
    end
    points
  end

  def dealer_first_hand
    cards_in_english = []
    first_card = cards[0]
    cards_in_english << Card.convert_to_english(first_card)
    cards_in_english[0]
  end

  def whole_hand(person)
    cards_in_english = []
    person.cards.each do |card|
      cards_in_english << Card.convert_to_english(card)
    end
    cards_in_english
  end
end

class Participant
  include Hand

  def busted?(hand_total)
    hand_total > 21
  end
end

class Dealer < Participant
  attr_reader :name

  def initialize
    @name = 'Dealer'
    super
  end
end

class Player < Participant
  attr_reader :name

  def initialize
    @name = player_name
    super
  end

  def player_name
    answer = nil
    loop do
      puts "=> What is your name?"
      answer = gets.chomp
      break if answer.size >= 1
      puts '=> Please type a name.'
    end
    answer
  end

  def hit_or_stay
    answer = nil
    loop do
      puts "=> Would you like to hit or stay? (h or s)"
      answer = gets.chomp.downcase
      puts ' '
      break if answer == 's' || answer == 'h'
      puts "=> Sorry, that is an invalid choice."
    end
    answer
  end
end

class Card
  attr_reader :face, :suit

  SUITS = ['H', 'D', 'S', 'C'].freeze
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A'].freeze

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def self.convert_to_word(shorthand)
    full_words = { 'H' => 'Hearts', 'D' => 'Diamonds', 'S' => 'Spades', 'C' => 'Clubs', 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
    full_words[shorthand]
  end

  def self.convert_to_english(card)
    eng_face = if /[A-Z]/ =~ card.face
                 convert_to_word(card.face)
               else
                 card.face
               end
    eng_suit = convert_to_word(card.suit)
    "#{eng_face} of #{eng_suit}"
  end

  def self.get_value(face, current_total)
    if (2..10).cover?(face.to_i)
      face.to_i
    elsif face == 'J' || face == 'Q' || face == 'K'
      10
    elsif current_total + 11 > 21
      1
    else
      11
    end
  end
end

class Deck
  attr_reader :available_cards

  def initialize
    @available_cards = []
    create_deck
  end

  def create_deck
    Card::SUITS.product(Card::FACES).each do |specs|
      @available_cards << Card.new(specs[0], specs[1])
    end
  end

  def deal_card
    picked_card = available_cards.sample
    @available_cards.delete(picked_card)
    picked_card
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    clear
    display_welcome_message
    loop do
      loop do
        deal
        display_first_hand
        player_turn
        break if bust?(player)
        dealer_turn
        break
      end
      display_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  def clear
    system 'clear'
  end

  def reset
    player.cards = []
    dealer.cards = []
    @deck = Deck.new
    clear
  end

  def display_welcome_message
    puts "=> Welcome to Twenty-One #{player.name}!"
    puts '-----------------------------------'
  end

  def display_goodbye_message
    puts '=> Thanks for playing Twenty-One! Goodbye!'
  end

  def play_again?
    answer = nil
    loop do
      puts '-----------------------------------'
      puts "=> Would you like to play again? (y or n)"
      answer = gets.chomp.downcase
      break if answer == 'y' || answer == 'n'
      puts "=> Sorry, that is not a valid answer."
    end
    answer == 'y'
  end

  def deal
    2.times { player.cards << deck.deal_card }
    2.times { dealer.cards << deck.deal_card }
  end

  def display_first_hand
    display_hand(dealer, 1)
    display_hand(player)
  end

  def joinor(cards_array, punctuation=', ', conjunction=' and ')
    if cards_array.size == 2
      cards_array.join(" " + conjunction)
    elsif cards_array.size > 2
      cards_array[-1].prepend(conjunction)
      cards_array.join(punctuation)
    end
  end

  def display_hand(person, how_many='all')
    if person.name.casecmp('dealer') && how_many == 1
      puts "#{person.name.upcase}'S HAND:"
      puts dealer.dealer_first_hand
      puts '??'
    else
      puts "#{person.name.upcase}'S HAND:"
      puts person.whole_hand(person).join("\n")
    end
    puts " "
  end

  def player_turn
    loop do
      answer = player.hit_or_stay
      break if answer == 's'
      player.cards << deck.deal_card
      display_hand(player)
      break if bust?(player)
    end
  end

  def dealer_turn
    loop do
      if dealer.total_points < 17
        dealer.cards << deck.deal_card
      else
        break
      end
    end
    display_hand(dealer, 'all')
  end

  def bust?(person)
    total = person.total_points
    person.busted?(total)
  end

  def find_winner
    player_final_points = player.total_points
    dealer_final_points = dealer.total_points

    display_final_score(player_final_points, dealer_final_points)

    if player_final_points > dealer_final_points
      player.name
    elsif dealer_final_points > player_final_points
      dealer.name
    elsif dealer_final_points == player_final_points
      'Neither'
    end
  end

  def display_result
    if bust?(player)
      puts '-----------------------------------'
      puts "=> #{player.name} is over 21! Game over - Dealer wins!"
    elsif bust?(dealer)
      puts '-----------------------------------'
      puts "=> #{dealer.name} is over 21! Game over - #{player.name} wins!"
    else
      puts "=> #{find_winner} won!"
    end
  end

  def display_final_score(player_score, dealer_score)
    puts ' '
    puts "#{player.name}: #{player_score}"
    puts "#{dealer.name}: #{dealer_score}"
    puts '-----------------------------------'
  end
end

Game.new.start
