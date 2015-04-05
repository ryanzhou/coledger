class ProjectsController < ApplicationController
  include CurrentProject

  def index
    render json: current_user.projects, each_serializer: ProjectSerializer
  end

  def show
    render json: current_project, serializer: ProjectSerializer
  end

  def create
    project = Project.new(project_params)
    project.owner = current_user
    project.save!
    render json: project, serializer: ProjectSerializer
  end

  def update
    current_admin_project.update!(project_params)
    render json: current_admin_project, serializer: ProjectSerializer
  end

  private
  def project_params
    params.permit(:name, :description, :currency)
  end
end
