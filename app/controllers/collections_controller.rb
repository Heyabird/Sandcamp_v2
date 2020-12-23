class CollectionsController < ApplicationController
    def index
        @collections = Collection.all.order(created_at: :desc)
        # render json: @collections
      end
    
      def create
        @collection = current_user.collections.new(collection_params)
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
end

im stressssssed
