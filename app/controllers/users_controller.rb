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
    @user = User.new(params[:user])
    if @user.save
      render text: "Thank you! You will receive an SMS shortly with verification instructions."
      
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @user.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )
    else
      render :new
    end
  end
 

end
