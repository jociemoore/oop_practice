# Description
# ---------------
# Twenty-One is a card game consisting of a dealer and a player, where the participants are trying to get as close as possible to 21 without going over.

# Overview:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he/she loses. If he/she stays, its the dealer's turn.
# - THe dealer must hit until his/her card add up to at least 17.
# - If the dealer busts, the player wins. If both player and dealer stays, then the highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# Nouns --> Dealer, Player, participant, deck, turn, total, card, game
# -----------

# Verbs --> deal, hit, stay, busts, win, tie, add, compare
# -----------

# Participant (Dealer, Player) --> hand
# - hit
# - stay
# - total
# - busted?
# - won?
# - tie?
# Deck
# - deal
# Game 
# - start
# - turn

# Dependencies
# ------------
# HAND --> Card
# PARTICIPANT --> 
# DEALER --> Participant, Hand
# PLAYER --> Participant, Hand 
# DECK --> Card
# CARD --> 
# GAME --> Deck, Card, Player, Dealer

class Participant
  def intiialize
    @hand
    @name
  end

  def hit
      
  end

  def stay
      
  end

  def total
      
  end

  def busted?
      
  end

  def won?

  end

  def tie?
      
  end
end

class Deck
    def initialize
      # 52-card deck
    end

    def deal
        
    end
end

class Game
    def start
      display_welcome_message
      loop do 
        loop do 
          initial_deal
          player_turn
          break if player_busted?
          dealer_turn
          break if dealer_busted?
          compare_totals
        end
        show_result
        break unless play_again?
      end
      display_goodbye_message
    end

    def take_turn
        
    end
end

Game.new.start