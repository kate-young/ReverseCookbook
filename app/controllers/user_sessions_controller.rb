class UserSessionsController < ApplicationController
  def new
  end

  def create 
     redirect_to recipes_path
  end
end
