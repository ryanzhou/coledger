class MembershipsController < ApplicationController
  def create
    project = current_user.memberships.admin.find_by(project_id: params[:project_id])
    user = User.find_by(username: params[:username])
    membership = project.memberships.build(user: user, project: project, role: params[:role])
    membership.save!
    render json: membership, serializer: MembershipSerializer
  end

  def update
  end
end
