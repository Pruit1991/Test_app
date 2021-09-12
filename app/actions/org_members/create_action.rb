# frozen_string_literal: true

class OrgMembers::CreateAction
  def call(org_member_params)
    org_member = OrgMember.new(org_member_params)
    org_member.save!

    org_member
  end
end
