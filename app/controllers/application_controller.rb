class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from Mongoid::Errors::Validations do |exception|
    render json: {errors: exception.record.errors.messages, error_code: "VALIDATION_ERROR" }, status: 422
  end

  protected
  def authenticate_user!

  end
end
