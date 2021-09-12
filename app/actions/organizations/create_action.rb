# frozen_string_literal: true

class Organizations::CreateAction
  def call(organization_params)
    organization = Organization.new(organization_params)
    organization.save

    organization
  end
end
