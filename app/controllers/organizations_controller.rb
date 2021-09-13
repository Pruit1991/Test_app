# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  include DI[
    create_organization: 'actions.organizations.create'
  ]

  def index
    @organizations = Organization.all.page(params[:page])
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = create_organization.(organization_params.merge(user: current_user))
    @org_member = OrgMember.create(user: current_user, organization: @organization, role: 'org_admin')
    flash[:success] = 'Organization created successfully!'
    redirect_to organization_path(@organization)
  end

  def show
    @organization = Organization.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Organization is missing!'
    redirect_to organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:title)
  end
end
