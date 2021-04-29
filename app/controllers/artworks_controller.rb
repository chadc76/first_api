class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    artworks = user.artworks
    shared_artworks = user.shared_artworks
    render json: (artworks + shared_artworks)
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

  def likes
    art = Artwork.find(params[:id])
    render json: {likes: art.likes.length}
  end

  def like
    like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def unlike
    like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
    if like.destroy
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    art = Artwork.find_by(id: params[:id], artist_id: params[:user_id])
    art.favorite = true
    art.save
    render json: art
  end

  def unfavorite
    art = Artwork.find_by(id: params[:id], artist_id: params[:user_id])
    art.favorite = false
    art.save
    render json: art
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end