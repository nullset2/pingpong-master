class UsersController < ApplicationController
  def index
    @users = User.all.order(ranking: :desc)
  end
end
