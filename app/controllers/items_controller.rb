class ItemsController < ApplicationController

      # root
      def index
        @items = Item.all
      end

      # GET /items/1
      def show
        @item = Item.find(params[:id])
      end

      # GET /items/1/edit
      def edit
        @item = Item.find(params[:id])
      end

      # GET /items/new
      def new
        @item = Item.new
      end

      # POST /items
      def create
        @item = Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
        if @item.save
          redirect_to root_path
          flash[:success] = "La carte a bien été créer!"
        else
          flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
          redirect_to root_path
        end

      end


      # PATCH/PUT /items/1
      def update
        @item = Item.find(params[:id])
        if @item.update(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
          redirect_to root_path
          flash[:success] = "La carte a bien été modifié!"
        else
          flash[:danger] = "La saisie n'a pas un format valide, merci de saisir à nouveau"
          redirect_to event_path
        end
      end


       # DELETE /items/1
      def destroy
        Item.find(params[:id]).delete
        redirect_to root_path
      end
end
