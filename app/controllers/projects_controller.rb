class ProjectsController < ApplicationController
  def index
    render json: current_user.projects, each_serializer: ProjectSerializer
  end

  def create
    project = Project.new(project_params)
    project.owner = current_user
    project.save!
    render json: project, serializer: ProjectSerializer
  end

  private
  def project_params
    params.permit(:name, :currency)
  end
end
