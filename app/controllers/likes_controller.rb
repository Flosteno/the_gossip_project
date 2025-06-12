class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @gossip = Gossip.find(params[:gossip_id])
    like = @gossip.likes.build(user: current_user)

    if like.save
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    like = @gossip.likes.find_by(user: current_user)
    like.destroy if like
    redirect_back fallback_location: root_path
  end


end
