class GossipsController < ApplicationController
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
end
