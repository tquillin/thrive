class UsersController < ApplicationController

  # users_new GET    /users/new(.:format)      users#new
  #           GET    /users/new(.:format)      users#new
  #    signup GET    /signup(.:format)         users#new
  def new
  end
  #     users GET    /users(.:format)          users#index
  #           POST   /users(.:format)          users#create
  #  new_user GET    /users/new(.:format)      users#new
  # edit_user GET    /users/:id/edit(.:format) users#edit


  #      user GET    /users/:id(.:format)      users#show
  def show
    @user = User.find(params[:id])
    # debugger
  end
  #           PATCH  /users/:id(.:format)      users#update
  #           PUT    /users/:id(.:format)      users#update
  #           DELETE /users/:id(.:format)      users#destroy

  def index

  end



end
