class MembershipsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    membership = current_project.memberships.build(user: user, role: params[:role])
    membership.save!
    render json: membership, serializer: MembershipSerializer
  end

  def update
    membership = current_project.memberships.find_by(id: params[:id])
    membership.update!(role: params[:role])
    render json: membership, serializer: MembershipSerializer
  end

  def destroy
    membership = current_project.memberships.find_by(id: params[:id])
    membership.delete
    render json: membership, serializer: MembershipSerializer
  end

  private
  def current_project
    current_user.memberships.admin.find_by(project_id: params[:project_id]).project
  end
end
