class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, notice: 'Cart a été créée.'
    else
      render :new
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart  a été mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_url, notice: 'Cart a été détruit.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
