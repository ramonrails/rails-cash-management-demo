class UsersController < ApplicationController
  def index
    # just showing this to any logged in user
    @users = User.all
  end
end
