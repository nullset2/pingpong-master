class LoggedGamesController < ApplicationController
  before_action :set_logged_game, only: [:show, :edit, :update, :destroy]

  # GET /logged_games
  def index
    @logged_games = LoggedGame.all
  end

  # GET /logged_games/1
  def show
  end

  # GET /logged_games/new
  def new
    @logged_game = LoggedGame.new
  end

  # GET /logged_games/1/edit
  def edit
  end

  # POST /logged_games
  def create
    @logged_game = LoggedGame.new(logged_game_params)

    if @logged_game.save
      redirect_to @logged_game, notice: 'Logged game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /logged_games/1
  def update
    if @logged_game.update(logged_game_params)
      redirect_to @logged_game, notice: 'Logged game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /logged_games/1
  def destroy
    @logged_game.destroy
    redirect_to logged_games_url, notice: 'Logged game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logged_game
      @logged_game = LoggedGame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def logged_game_params
      params.require(:logged_game).permit(:date_played, :user_id, :opponent_id, :user_score, :opponent_score)
    end
end
