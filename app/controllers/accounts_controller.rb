class AccountsController < ApplicationController
  def index
    accounts = current_project.accounts
    render json: accounts, each_serializer: AccountSerializer
  end

  def show
    account = current_project.accounts.find(params[:id])
    render json: account, serializer: AccountSerializer
  end

  private
  def current_project
    current_user.memberships.find_by(project_id: params[:project_id]).project
  end
end
