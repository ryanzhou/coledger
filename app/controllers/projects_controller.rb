class ProjectsController < ApplicationController
  def index
    render json: current_user.projects, each_serializer: ProjectSerializer
  end

  def create
    project = current_user.projects.build(project_params)
    project.save!
    render json: project, serializer: ProjectSerializer
  end

  private
  def project_params
    params.permit(:name, :currency)
  end
end
