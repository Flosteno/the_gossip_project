class SessionsController < ApplicationController
  def new

  end

  def create
    
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Connexion établie"
    else
      flash.now[:alert] = 'Combinaison email/mot de passe invalide'
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Vous avez été déconnecté"
  end
end
