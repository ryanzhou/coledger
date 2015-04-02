class TransactionsController < ApplicationController
  def index
    render json: current_account.transactions, serializer: TransactionSerializer
  end

  def create
    transaction = current_editing_account.transactions.create!(transaction_params)
    render json:
  end

  private
  def current_account
    current_project.accounts.find(params[:account_id])
  end

  def current_editing_account
    current_editing_project.accounts.find(params[:account_id])
  end

  def transaction_params
    params.permit(:name, :description, :amount, :list_id)
  end
end
