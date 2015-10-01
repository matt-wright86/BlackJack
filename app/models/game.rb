class Game < ActiveRecord::Base
    belongs_to :player_hand
    belongs_to :dealer_hand
    belongs_to :deck
end
