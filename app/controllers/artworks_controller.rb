class ArtworksController < ApplicationController
  def index
    render json: Artwork.all
  end
  
  def create
    art = Artwork.new(artwork_params)
    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    art = Artwork.find(params[:id])
    render json: art
  end

  def update
    art = Artwork.find(params[:id])
    if art.update(artwork_params)
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    art = Artwork.find(params[:id])
    art.destroy
    render json: art
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end