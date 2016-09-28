require 'test_helper'

class LoggedGamesControllerTest < ActionController::TestCase
  setup do
    @logged_game = logged_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logged_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logged_game" do
    assert_difference('LoggedGame.count') do
      post :create, logged_game: { date_played: @logged_game.date_played, opponent_id: @logged_game.opponent_id, opponent_score: @logged_game.opponent_score, user_id: @logged_game.user_id, user_score: @logged_game.user_score }
    end

    assert_redirected_to logged_game_path(assigns(:logged_game))
  end

  test "should show logged_game" do
    get :show, id: @logged_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logged_game
    assert_response :success
  end

  test "should update logged_game" do
    patch :update, id: @logged_game, logged_game: { date_played: @logged_game.date_played, opponent_id: @logged_game.opponent_id, opponent_score: @logged_game.opponent_score, user_id: @logged_game.user_id, user_score: @logged_game.user_score }
    assert_redirected_to logged_game_path(assigns(:logged_game))
  end

  test "should destroy logged_game" do
    assert_difference('LoggedGame.count', -1) do
      delete :destroy, id: @logged_game
    end

    assert_redirected_to logged_games_path
  end
end
