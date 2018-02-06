class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_id( params[:id] )
    @items = Item.where(user_id: @user.id)
  end
end
