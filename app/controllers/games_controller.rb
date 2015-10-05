class GamesController < ApplicationController

  def index
  end

  def show
     @game = Game.find params[:id]


  end

  def create
    @game = Game.create
    @game.build_cards
    player_hand = Hand.create game_id: @game.id, player: true
    dealer_hand = Hand.create game_id: @game.id, player: false

    player_hand.cards << @game.deck.sample(2)
    dealer_hand.cards << @game.deck.sample(2)
    redirect_to game_path(id: @game.id)
  end

  def hit
    @game = Game.find params[:id]
    # add a card to each hand?
    @game.player_hand.cards << @game.deck.first

    if @game.dealer_hand.total < @game.player_hand.total && @game.dealer_hand.total <= 16 && @game.player_hand.total < 21
       @game.dealer_hand.cards << @game.deck.second
     elsif @game.dealer_hand.total > @game.player_hand.total && @game.dealer_hand.total < 21
     elsif @game.player_hand.total >= 20
     elsif @game.player_hand.total == 21
       @game.dealer_hand.cards << @game.deck.second
    end
    redirect_to game_path(id: @game.id)
  end

  def stay
    @game = Game.find params[:id]
    # add a card to each hand?
    if @game.dealer_hand.total < 21 && @game.dealer_hand.total < @game.player_hand.total && @game.player_hand.total <= 16
       @game.dealer_hand.cards << @game.deck.second
    elsif @game.dealer_hand.total <= @game.player_hand.total && @game.dealer_hand.total <= 16
       @game.dealer_hand.cards << @game.deck.second
    elsif @game.dealer_hand.total >= 17
    end
    redirect_to game_path(id: @game.id)
  end




end
