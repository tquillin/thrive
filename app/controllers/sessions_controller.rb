class SessionsController < ApplicationController

      # sessions_new GET    /sessions/new(.:format)   sessions#new
      #        login GET    /login(.:format)          sessions#new

      def new
      end


      #              POST   /login(.:format)          sessions#create

      def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to user
          # Log the user in and redirect to the user's show page.
        else
          # Create an error message
          flash.now[:danger] = 'Invalid email/password combination' #Not quite right/correct.
          render 'new'
        end
      end


      #       logout DELETE /logout(.:format)         sessions#destroy

      def destroy
        log_out
        redirect_to root_url
      end


end
