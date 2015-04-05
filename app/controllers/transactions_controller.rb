class TransactionsController < ApplicationController
  include CurrentProject

  def index
    render json: current_account.transactions, each_serializer: TransactionSerializer
  end

  def create
    transaction = current_editing_account.transactions.build
    transaction.attributes = transaction_params
    transaction.save!
    render json: transaction, serializer: TransactionSerializer
  end

  def update
    transaction = current_editing_account.transactions.find(params[:id])
    transaction.update!(transaction_params)
    render json: transaction, serializer: TransactionSerializer
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
