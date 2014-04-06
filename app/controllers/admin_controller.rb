class AdminController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :login]

  def index
    # Displays the login form.
  end

  def login
    authorized_user = User.authenticate(params[:username],params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "index"  
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
