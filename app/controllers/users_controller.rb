class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:create]

  def create
    user = User.create!(user_params)
    render json: user, serializer: UserSerializer
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
