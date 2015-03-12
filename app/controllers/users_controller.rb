class UsersController < ApplicationController

  def create
    @user = User.create!(user_params)
    render json: @user, serializer: UserSerializer
  end

  private
  def user_params
    params.permit(:username, :email, :password, :first_name, :last_name)
  end
end
