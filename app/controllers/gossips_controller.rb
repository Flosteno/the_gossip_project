class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content])
  
    if @gossip.save
      redirect_to root_path, notice: "Le super potin a bien été sauvegardé !"
    else
      redirect_to new_gossip_path, alert: "Erreur: vous devez remplir tous les champs"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content)
  end

end
