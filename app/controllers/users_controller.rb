class UsersController < ApplicationController
  def index
    @users = User.all.order(:ranking)
  end
end
