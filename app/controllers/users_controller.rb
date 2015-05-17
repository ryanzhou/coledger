class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:create, :send_passwd_reset_email, :reset_password]

  def create
    user = User.create!(user_params)
    UserMailer.welcome_email(user).deliver_later
    render json: user, serializer: UserSerializer
  end

  def send_passwd_reset_email 
    user = User.where(email: params[:email]).first
    user.assign_reset_token
    UserMailer.password_reset(user).deliver_now
    render json: user, each_serializer: UserProfileSerializer
  end


  def show
    render json: current_user, serializer: UserSerializer
  end

  def update
    if !params[:password].present? or current_user.authenticate(params[:current_password])
      current_user.update!(user_params)
      render json: current_user, serializer: UserSerializer
    else
      render json: {errors: ["Current password is incorrect"], error_code: "VALIDATION_ERROR"}.to_json, status: 422
    end
  end



  def search
    users = User.where(username: /^#{params[:username]}.*/i).limit(10)
    render json: users, each_serializer: UserProfileSerializer
  end

  private
  def user_params
    params.permit(:username, :email, :password, :first_name, :last_name)
  end
end
