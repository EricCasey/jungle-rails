class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    # user = User.authenticate_with_credentials(user_params[:email], user_params[:password])
    if user.save
      session[:user_id] = user.id
      #puts user_params[:email], user_params[:password]
      UserMailer.welcome_email(user).deliver_now
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
