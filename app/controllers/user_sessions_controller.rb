class UserSessionsController < ApplicationController
  def new
  end

  def create 
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
	session[:user_id] = user.id
	flash[:success]  = "You are now logged in."
	redirect_to recipes_path
     else
	flash[:error] = "There was a problem logging in"
	render action: 'new'
     end
  end
end
