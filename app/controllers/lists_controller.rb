class ListsController < ApplicationController
  def index
    render json: current_account.lists, serializer: ListSerializer
  end

  def create
    list = current_account.lists.create!(list_params)
    render json: list, serializer: ListSerializer
  end

  private
  def current_account
    project = current_user.memberships.find_by(project_id: params[:project_id]).project
    project.accounts.find(params[:account_id])
  end

  def current_editing_account
    project = current_user.memberships.editing.find_by(project_id: params[:project_id]).project
    project.accounts.find(params[:account_id])
  end

  def list_params
    params.permit(:name, :color)
  end
end
