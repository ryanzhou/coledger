class PasswordResetsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:update]
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def create
    @user  = User.find_by(email: params[:email])
    render json: @user, serializer: UserSerializer
  end

  def new
  end

  def edit
  end

  def update
  end

  def update
    @user.password = params[:password]
    unless @user.save
      render json: { error: "Something went wrong. Please make sure the link is correct!", error_code: "AUTHENTICATION_ERROR" }, status: 403
    end
    render json: @user, serializer: UserSerializer
  end

  private
    # Returns true if password is blank.
    def password_blank?
      params[:password].blank?
    end

    def authenticated? (param_token)
      puts @user[:reset_token]
      @user[:reset_token] == param_token
    end

    # Before filters

    def get_user
      @user = User.where(email: params[:email]).first
      unless @user
        render json: { error: "Please make sure the link is correct!", error_code: "AUTHENTICATION_ERROR" }, status: 403
      end
    end

    # Confirms a valid user.
    def valid_user
      unless authenticated?(params[:reset_token])
        render json: { error: "Something went wrong. Please make sure the link is correct!", error_code: "AUTHENTICATION_ERROR" }, status: 403
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.reset_token_expired?
        render json: { error: "Reset token expires. Please register your email again!", error_code: "AUTHENTICATION_ERROR" }, status: 403
      end
    end
end