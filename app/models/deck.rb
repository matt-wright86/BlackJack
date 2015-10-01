class Deck < ActiveRecord::Base
  belongs_to :game
  has_many :cards


    def build_deck
      suits = [:hearts, :diamonds, :spades, :clubs]
      suits.each do |suit|
        (2..10).each do |value|
        cards << Card.create(suit, value)
                     end
      cards.create(suit, "J")
      cards.create(suit, "Q")
      cards.create(suit, "K")
      cards.create(suit, "A")
                end
   end


end
