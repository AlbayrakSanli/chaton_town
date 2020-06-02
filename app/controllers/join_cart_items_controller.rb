class JoinCartItemsController < ApplicationController

  # les fonctions sont dans private
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @joins = JoinCartItem.all
  end

  def show
  end

  def new
    @join = JoinCartItem.new
  end

  def edit
  end

  def create
    item = Item.find(params[:item_id])
    @join = @cart.add_product(item) #voir le before_action qui renvoie la fonction dans private

    if @join.save
      redirect_to @join.cart, notice: 'La jointure Cart/Item a été créée.'
    else
      render :new
    end

  end

  def update
    if @join.update(line_item_params)
      redirect_to @join, notice: 'La jointure Cart/Item a été mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @join.destroy
    redirect_to line_items_url, notice: 'La jointure Cart/Item a été détruit.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @join = JoinCartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:cart_id, :item_id, :quantity)
    end

    def set_cart
      @cart = Cart.find_by(id:session[:cart_id]) || Cart.create
      session[:cart_id] ||= @cart.id
    end
end
