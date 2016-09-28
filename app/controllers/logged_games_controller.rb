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
    @logged_game = LoggedGame.new(logged_game_params)
    current_user.logged_games << @logged_game

    if current_user.logged_games.save
      redirect_to @logged_game, notice: 'Logged game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @logged_game.update(logged_game_params)
      redirect_to @logged_game, notice: 'Logged game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @logged_game.destroy
    redirect_to logged_games_url, notice: 'Logged game was successfully destroyed.'
  end

  private
    def set_logged_game
      @logged_game = LoggedGame.find(params[:id])
    end

    def logged_game_params
      params.require(:logged_game).permit(:date_played, :user_id, :opponent_id, :user_score, :opponent_score)
    end
end
