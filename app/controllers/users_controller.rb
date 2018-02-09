class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_id( params[:id] ) || current_user
    @items = Item.where(user_id: @user.id)
    @item = Item.new
  end
end
