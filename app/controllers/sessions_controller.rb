class SessionsController < ApplicationController
  def new

  end

  def create
    
    user = User.find_by(email: :email)

    if user && user.authenticate(:password)
      session[:user_id] = user.id
    else
      flash.now[:alert] = 'Combinaison email/mot de passe invalide'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
