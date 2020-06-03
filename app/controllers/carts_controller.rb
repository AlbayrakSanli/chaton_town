class CartsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end
>>>>>>> developpement

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

<<<<<<< HEAD
  def update
    JoinCartItem.create(cart_id: @cart.id,
                        item_id: Item.find(params[:id]).id,
                        quantity: params[:quantity])

    respond_to do |format|
      format.js {}
      format.html { render 'new'}
    end
  end

  def destroy
    item = Item.find(params[:id])
    JoinCartItem.find_by(cart_id: @cart.id, item_id: item.id).destroy
    respond_to do |format|
      format.js
    end
  end

  def is_in_cart?(id)
    self.join_cart_iems.find_by(cart_id: self.id, item_id: id)
=======
  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
>>>>>>> developpement
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :id)
  end

end
