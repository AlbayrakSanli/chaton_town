class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @order = Order.new(user: current_user, stripe_customer_id: customer.id)
    if @order.save
      @cart.join_cart_items.each { |joint|
        JoinTableOrderItem.create(order: @order, item: joint.item)
        joint.destroy
      }
    end

    AdminMailer.order_notification(@order).deliver_now

    UserMailer.order_confirmation(@order).deliver_now

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
