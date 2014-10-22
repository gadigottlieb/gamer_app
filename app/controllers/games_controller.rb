class GamesController < ApplicationController

  def home
    render layout: 'application', text: ''
  end

  def search
    games  = GameApi.search(params[:query])
    render json: games
  end

  def show
    game = GameApi.game(params[:id])
    render json: game
  end

end
