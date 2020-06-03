class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @email = @user.email
  end

  def create
    @order = Order.new(user: current_user)
    if @order.save
      @cart.join_cart_items.each { |joint|
        JoinTableOrderItem.create(order: @order, item: joint.item)
        joint.destroy
      }
      redirect_to root_path
      flash[:success] = "New order created"
    else
      flash[:danger] = "Error, new order couldn't be created"
      redirect_to root_path
    end
  end

  def update
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    if current_user == @user
      @order.destroy
      flash[:success] = "Order deleted"
      redirect_to root_path
    else
      flash[:failure] = "Order delete failed"
      render :edit
    end
  end

end
