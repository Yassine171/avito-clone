class AnnoncesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = current_user.annonces.build(annonce_params)
    if @annonce.save
      redirect_back(fallback_location: root_path, notice: 'L\'annonce a été créée avec succès.')
    else
      render :new
    end
  end

  def edit
  end

  def index
    @annonces = Annonce.all.paginate(page: params[:page], per_page: 5)

    if params[:keyword].present?
      @annonces = @annonces.where('title LIKE ?', "%#{params[:keyword]}%")
    end

    if params[:category].present?
      @annonces = @annonces.where(category_id: params[:category])
    end

    if params[:ville].present?
      @annonces = @annonces.where(ville_id: params[:ville])
    end

    @annonces = @annonces.page(params[:page]).paginate(page: params[:page], per_page: 5)
  end

  def update
    if @annonce.update(annonce_params)
      redirect_to @annonce, notice: 'L\'annonce a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @annonce.destroy
    redirect_back(fallback_location: root_path, notice: 'Annonce a été détruite avec succès.')
  end

  def show_category
     @category = Category.find(params[:id])
    @annonces = Annonce.where(category_id: @category.id).paginate(page: params[:page], per_page: 5)
    if params[:keyword].present?
      @annonces = Annonce.where('title LIKE ?', "%#{params[:keyword]}%").page(params[:page]).paginate(page: params[:page], per_page: 5)
    end
  end


  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def check_owner
    if @annonce.user != current_user
      redirect_to @annonce, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end

  def annonce_params
    params.require(:annonce).permit(:title, :description, :price, :etat, :type_transaction, :ville_id, :category_id, images: [])
  end
end
