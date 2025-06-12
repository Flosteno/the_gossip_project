class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    
    if @user.save
      redirect_to root_path, notice: "Compte crée avec succés"
    else
      flash.now[:alert] = "Erreur : veuillez remplir tous les champs correctement."
      render :new, status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :description, :email, :age, :city_id)
  end
end
