class UsersController < ApplicationController
  def show
    @name = current_user.name
    @contents = current_user.contents
  end
end
