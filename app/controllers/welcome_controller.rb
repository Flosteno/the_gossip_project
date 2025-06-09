class WelcomeController < ApplicationController
  def hello
    @user_name = params[:user_name]
  end
end
