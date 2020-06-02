class ApplicationController < ActionController::Base
    before_action :guest_cart

    def guest_cart
      if user_signed_in?
        @cart = current_user.cart
      else
        @cart = Cart.find_by(id:session[:cart_id]) || Cart.create
        session[:cart_id] ||= @cart.id
      end
    end


end
