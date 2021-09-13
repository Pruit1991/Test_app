# frozen_string_literal: true

class OrgMembersController < ApplicationController
  before_action :authenticate_user!
  include DI[
    create_member: 'actions.org_members.create'
  ]

  def create
    @org_member = create_member.(org_member_params)
    flash[:success] = 'User invited!'
    redirect_back fallback_location: organizations_path
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'User not found!'
    redirect_back fallback_location: organizations_path
  end

  def show
    @org_members = OrgMember.all.page(params[:page])
    @organization = Organization.find(params[:id])
    @org_member = OrgMember.find_by!(user: current_user, organization: @organization)
    authorize @org_member, :show?
    @orders = Order.all
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'you are not member of this organization!'
    redirect_back fallback_location: organizations_path
  end

  private

  def permitted_params
    params.permit(:user_id, :organization_id, :role, :email)
  end

  def org_member_params
    {
      role: permitted_params[:role],
      user: User.find_by!(email: permitted_params[:email].strip),
      organization: Organization.find(permitted_params[:organization_id])
    }
  end
end
