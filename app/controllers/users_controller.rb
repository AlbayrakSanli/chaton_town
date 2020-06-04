class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit]

  def show
    @email = current_user.email
    @orders = current_user.orders
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      flash[:success] = "Profile deleted"
      redirect_to root_path
    else
      flash[:failure] = "Profile delete failed"
      render :edit
    end
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
