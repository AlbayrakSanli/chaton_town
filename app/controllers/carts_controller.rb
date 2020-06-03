class CartsController < ApplicationController
  before_action :authenticate_user, only: [:show, :update]

  def show
  end

  def update
    JoinCartItem.create(cart_id: @cart.id, item_id: Item.find(params[:id]).id, quantity: params[:quantity])
    redirect_to cart_path(@cart)
  end

  def destroy
    item = Item.find(params[:id])
    JoinCartItem.find_by(cart_id: @cart.id, item_id: item.id).destroy
    redirect_to cart_path(@cart)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :id)
  end

end
