class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  attr :current_user, :current_session

  before_filter :authenticate_user!

  rescue_from Mongoid::Errors::Validations do |exception|
    render json: {errors: exception.record.errors.full_messages, error_code: "VALIDATION_ERROR" }, status: 422
  end

  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    render json: { error: "The object does not exist or you do not have the permission to access it.", error_code: "DOCUMENT_NOT_FOUND"}, status: 404
  end

  protected
  def authenticate_user!
    authenticate_or_request_with_http_token('CoLedger API') do |token, options|
      session = Session.where(token: token).first
      if session
        @current_session = session
        session.touch
        @current_user = session.user
      end
    end
  end

  def default_serializer_options
    { root: false }
  end
end
