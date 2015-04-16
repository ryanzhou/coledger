class CommentsController < ApplicationController
  include CurrentProject

  def index
    render json: current_transaction.comments.order(created_at: :asc), each_serializer: CommentSerializer
  end

  def create
    comment = current_transaction.comments.create!(content: params[:content], user: current_user)
    render json: comment, serializer: CommentSerializer
  end

  private
  def current_account
    current_project.accounts.find(params[:account_id])
  end

  def current_transaction
    current_account.transactions.find(params[:transaction_id])
  end
end
