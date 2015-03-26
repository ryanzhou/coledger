class AccountsController < ApplicationController
  def index
    accounts = current_project.accounts
    render json: accounts, each_serializer: AccountSerializer
  end

  def show
    account = current_project.accounts.find(params[:id])
    render json: account, serializer: AccountSerializer
  end

  def create
    account = current_editing_project.accounts.create!(account_params)
    render json: account, serializer: AccountSerializer
  end

  private
  def current_project
    current_user.memberships.find_by(project_id: params[:project_id]).project
  end

  def current_editing_project
    current_user.memberships.editing.find_by(project_id: params[:project_id]).project
  end

  def account_params
    params.permit(:name, :account_type)
  end
end
