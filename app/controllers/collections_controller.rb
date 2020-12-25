class CollectionsController < ApplicationController
  # before_action :set_collection, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

    def index
      @collections = current_user.collections.order(created_at: :desc)
        # render json: @collections
    end

    def show
      @collection = current_user.collections.find(params[:id])
    end

    def new
      @collection = current_user.Collection.new
    end
  
    def create
      @collection = current_user.Collection.new(collection_params)
      respond_to do |format|
        if @collection.save
            format.html { redirect_to @collection, notice: 'Album has been saved to collection.' }
            format.json { render :show, status: :created, location: @collection }
        else
            format.html { render :new }
            format.json { render json: @collection.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @collection = current_user.collections.find(params[:id])
    end

    def update
      @collection = current_user.collections.find(params[:id])
      if @collection.update_attributes(collection_params)   
        flash[:notice] = 'Collection updated!'   
        redirect_to root_path   
      else   
        flash[:error] = 'Failed to edit collection!'   
        render :edit   
      end   
    end   

    def destroy
      @collection = current_user.collections.find(params[:id])
      if @collection.delete
        flash[:notice] = 'Collection deleted'
        redirect_to root_path
      else
        flash[:error] = 'Failed to delete this collection!'   
        render :destroy 
      end  
    end 

    #use strong parameters for the validation of params
      def collection_params
        params.require(:collection).permit(:album_name, :artist_name, :comment)
      end
end

