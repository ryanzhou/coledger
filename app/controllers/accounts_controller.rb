class AccountsController < ApplicationController
  include CurrentProject

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

  def update
    account = current_editing_project.accounts.find(params[:id])
    account.update!(account_params)
    render json: account, serializer: AccountSerializer
  end

  private
  def account_params
    params.permit(:name, :account_type)
  end
end
