class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @contents = user.contents
  end
end
