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
  def new
    @user = User.new
  end
 

  def create
    @user = User.new(user_params)
    if @user.save
      # Save the user_id to the session object
      session[:user_id] = @user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)

    else
      render :new
    end
  end
 

end
