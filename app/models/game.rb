class Game < ActiveRecord::Base
  has_many :cards
  has_many :hands

  def deck
    cards.where(hand_id: nil).order("position")
  end

  def build_cards
    positions = (1..52).to_a.shuffle

    suits = ["H", "D", "C", "S"]
    suits.each do |suit|
      (2..10).each do |val|
        cards.create suit: suit, value: val, name: val, position: positions.shift
      end
      ["J", "Q", "K"].each do |val|
        cards.create suit: suit, value: 10, name: val, position: positions.shift
      end
      cards.create suit: suit, value: 11, name: "A", position: positions.shift
    end



  end

  def player_hand
    hands.find_by player: true
  end

  def dealer_hand
    hands.find_by player: false
  end

  def p_bust
    player_hand.total > 21
  end

  def d_bust
    dealer_hand.total > 21
  end

  def blackjack
    if dealer_hand.total == 21 || player_hand.total == 21
      "Blackjack"
    end
  end


  def player_wins?
    if player_hand.total > dealer_hand.total && player_hand.total <= 21
      return "Player Wins"
    elsif dealer_hand.total > player_hand.total && dealer_hand.total <=21
      return "Dealer Wins"
    elsif dealer_hand.total == player_hand.total
      return "Push"
    elsif d_bust && player_hand.total <= 21
      return "Player Wins"
    elsif p_bust && dealer_hand.total <= 21
      return "Dealer Wins"
    end
  end


end
