class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @items = Item.where(user_id: current_user.id)
  end
end
