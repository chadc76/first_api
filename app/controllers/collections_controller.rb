class CollectionsController < ApplicationController
  def index
    collections = User.find(params[:user_id]).collections
    render json: collections
  end

  def show
    collection = Collection.find(params[:id]).artworks
    render json: collection
  end

  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    render json: collection
  end

  def add_artwork
    art_collection = ArtworkCollection.new(artwork_collection_params)
    if art_collection.save
      flash[:notice] = "Added art to Collection"
      redirect_to collection_url(params[:collection_id])
    else
      render json: art_collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def remove_artwork
    art_collection = ArtworkCollection.find_by(artwork_collection_params)
    art_collection.destroy
    flash[:notice] = "Removed art from Collection"
    redirect_to collection_url(params[:collection_id])
  end

  private

  def collection_params
    params.require(:collection).permit(:user_id, :name)
  end

  def artwork_collection_params
    art_params = {collection_id: params[:collection_id], artwork_id: params[:id]}
  end
end