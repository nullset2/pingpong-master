class LoggedGamesController < ApplicationController
  before_action :set_logged_game, only: [:show, :edit, :update, :destroy]

  def index
    @logged_games = current_user.logged_games
  end

  def show
  end

  def new
    @logged_game = LoggedGame.new
  end

  def edit
  end

  def create
    @logged_game = current_user.logged_games.new(logged_game_params) 
    
    if @logged_game.save
      redirect_to @logged_game, notice: 'The Game has been logged.'
    else
      render :new
    end
  end

  def update
    if @logged_game.update(logged_game_params)
      redirect_to @logged_game, notice: 'The Game has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @logged_game.destroy
    redirect_to logged_games_url, notice: 'This Game has been successfully destroyed.'
  end

  private
    def set_logged_game
      @logged_game = LoggedGame.find(params[:id])
    end

    def logged_game_params
      params.require(:logged_game).permit(:date_played, :user_id, :opponent_id, :user_score, :opponent_score)
    end
end
