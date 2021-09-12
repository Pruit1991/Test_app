# frozen_string_literal: true

class OrgMemberPolicy
  attr_reader :user, :org_member

  def initialize(user, org_member)
    @user = user
    @org_member = org_member
  end

  def show?
    org_member.user == user && org_member.role == 'org_admin'
  end
end
