class UsersController < ApplicationController
  #      user GET    /users/:id(.:format)      users#show
  def show
    @user = User.find(params[:id])
    # debugger
  end
  # users_new GET    /users/new(.:format)      users#new
  #           GET    /users/new(.:format)      users#new
  #    signup GET    /signup(.:format)         users#new
  def new
    @user = User.new
  end
  #     users GET    /users(.:format)          users#index
  #           POST   /users(.:format)          users#create
  def create
      @user = User.new(user_params) # Not the final implementation!
        if @user.save
          log_in @user
          flash[:success] = "Welcome to the Sample App!"
          redirect_to @user #this redirects to the new created user profile on his/her profile page
          # Handle a successful save.
        else
          render 'new'
        end
  end
  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit



  #           PATCH  /users/:id(.:format)      users#update
  #           PUT    /users/:id(.:format)      users#update
  #           DELETE /users/:id(.:format)      users#destroy

  # def index
  #
  # end

  # def logged_in
  #
  # end

  private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
