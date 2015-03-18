class SessionsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:create]

  def create
    user = User.where(username: params[:username]).first.try(:authenticate, params[:password])
    if user
      session = user.sessions.create!
      render json: session, serializer: SessionSerializer
    else
      render json: { error: "Invalid username/password.", error_code: "AUTHENTICATION_ERROR" }, status: 403
    end
  end

  def show
    render json: current_session, serializer: SessionSerializer
  end

  def destroy
    current_session.delete
    render json: current_session, serializer: SessionSerializer
  end

end
