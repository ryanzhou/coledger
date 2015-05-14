class PasswordResetsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create, :update_password]
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def create
    user  = User.find_by(email: params[:email])
    render json: user, serializer: UserSerializer
  end

  def new
  end

  def edit
  end

  def update
  end

  def update_password
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    else 
      user = User.find_by(email: params[:emai])
      if user
        debugger
        user.update_attributes!(user_params)
        flash.now[:success] = "I am stupid!" 
        log_in user
      else
        flash.now[error] = "Invalid email"
        redirect_to root_url
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Returns true if password is blank.
    def password_blank?
      params[:user][:password].blank?
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless @user.authenticated?(:reset_token, params[:reset_token])
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end