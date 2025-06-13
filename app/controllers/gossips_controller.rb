class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :update, :create]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(post_params)
    @gossip.user = current_user
  
    if @gossip.save
      redirect_to root_path, notice: "Le super potin a bien été sauvegardé !"
    else
      flash.now[:alert] = "Erreur : veuillez remplir tous les champs correctement."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    if @gossip.update(post_params)
      redirect_to @gossip, notice: "Le potin a été mis à jour avec succès."
    else
      flash.now[:alert] = "Erreur : veuillez remplir tous les champs correctement."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_path, notice: "Potin supprimé avec succès."
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content, tag_ids: [])
  end

end
