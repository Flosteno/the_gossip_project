class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include SessionsHelper

  private

  def authenticate_user
    unless current_user
      flash[:alert] = "Vous devez être connecté pour continuer."
      redirect_to new_session_path, status: :unprocessable_entity
    end
  end

  def authorize_user
  @gossip = Gossip.find(params[:id])
  unless @gossip.user == current_user
    redirect_to @gossip, alert: "Vous n'êtes pas autorisé à faire cela."
  end
end


end
