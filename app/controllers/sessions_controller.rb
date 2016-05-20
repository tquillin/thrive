class SessionsController < ApplicationController

      # sessions_new GET    /sessions/new(.:format)   sessions#new
      #        login GET    /login(.:format)          sessions#new

      def new
      end


      #              POST   /login(.:format)          sessions#create

      def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          if user.activated?
            log_in user
            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
            redirect_back_or user

        else
          message = "Account not activated."
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
        end
      else
          flash.now[:danger] = 'Invalid email/password combination' #Not quite right/correct.
        render 'new'
          # log_in user
          # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          # redirect_back_or user
          # # Log the user in and redirect to the user's show page.
        # else
          # Create an error message

        end
      end


      #       logout DELETE /logout(.:format)         sessions#destroy

      def destroy
        log_out if logged_in?
        redirect_to root_url
      end


end
