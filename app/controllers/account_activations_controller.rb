class AccountActivationsController < ApplicationController

  # Preventing our code from activating users who have already been activated.
  def edit
    user = User.find_by(email: params[:email])
    #prevents code from re-activating users.
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate 
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end