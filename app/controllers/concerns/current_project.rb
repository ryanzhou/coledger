module CurrentProject
  extend ActiveSupport::Concern

  private
  def current_project
    @current_project ||= current_user.memberships.find_by(project_id: params[:project_id] || params[:id]).project
  end

  def current_admin_project
    @current_admin_project ||= current_user.memberships.admin.find_by(project_id: params[:project_id] || params[:id]).project
  end

  def current_editing_project
    @current_editing_project ||= current_user.memberships.editing.find_by(project_id: params[:project_id] || params[:id]).project
  end
end
