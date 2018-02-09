class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  def show
    @user = User.find_by_id( params[:id] ) || current_user
    @items = Item.where(user_id: @user.id)
    @item = Item.new
  end

  private

  def authorize_user
    requested_user = User.find_by_id( params[:id] ) || current_user

    unless current_user == requested_user
      flash[:alert] = "User's profiles are private. Welcome back to your profile."
      redirect_to current_user
    end
  end
end
