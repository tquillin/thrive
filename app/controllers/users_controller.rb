class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]



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

  def index
    @users = User.paginate(page: params[:page])
    # @users = User.all
  end

  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit
  def edit
      # @user = User.find(params[:id])
  end


  #           PATCH  /users/:id(.:format)      users#update
  #           PUT    /users/:id(.:format)      users#update
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        # Handle a successful update.
        flash[:success] = "La profile est mise à jour"
        redirect_to @user
      else
        render 'edit'
      end
    end

  #           DELETE /users/:id(.:format)      users#destroy
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url #Only admin can delete now.

    end
  private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Confirms a loggedn-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Por favor, please log in."
        redirect_to login_url
    end
  end

  # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

# Confirms an admin user.
      def admin_user
          redirect_to(root_url) unless current_user.admin? 
      end
end
