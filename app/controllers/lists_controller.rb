class ListsController < ApplicationController
  include CurrentProject

  def index
    render json: current_account.lists, serializer: ListSerializer
  end

  def create
    list = current_editing_account.lists.create!(list_params)
    render json: list, serializer: ListSerializer
  end

  def update
    list = current_editing_account.lists.find(params[:id])
    list.update!(list_params)
    render json: list, serializer: ListSerializer
  end

  private
  def current_account
    current_project.accounts.find(params[:account_id])
  end

  def current_editing_account
    current_editing_project.accounts.find(params[:account_id])
  end

  def list_params
    params.permit(:name, :color)
  end
end
