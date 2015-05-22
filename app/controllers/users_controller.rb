class UsersController < ApplicationController
		before_action :authenticate_user!
 
  def update
  	if params[:user][:password].blank?
  params[:user].delete(:password)
  params[:user].delete(:password_confirmation)
	end
  end

  def show
  end

end
