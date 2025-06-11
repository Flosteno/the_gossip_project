class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @gossip = Gossip.find(params[:gossip_id])
  end
end
