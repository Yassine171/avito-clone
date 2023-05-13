# app/controllers/favorites_controller.rb

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.includes(:annonce)
  end
  
  def create
    @annonce = Annonce.find(params[:annonce_id])
    favorite = current_user.favorites.new(annonce: @annonce)
    if favorite.save
      render json: { success: true }
    else
      render json: { success: false, error: favorite.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def destroy
    @annonce = Annonce.find(params[:id])
    @favorite = current_user.favorites.find_by(annonce: @annonce)
    if @favorite
      @favorite.destroy
      render json: { success: true }
    else
      render json: { success: false, error: "Favorite not found" }, status: :not_found
    end
  end
end
