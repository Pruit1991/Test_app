# frozen_string_literal: true

module AutoInjectActions
  extend Dry::Container::Mixin

  def self.extended(container)
    container.instance_exec do
      namespace :actions do
        namespace :orders do
          register(:create) { Orders::CreateAction.new }
        end

        namespace :organizations do
          register(:create) { Organizations::CreateAction.new }
        end

        namespace :org_members do
          register(:create) { OrgMembers::CreateAction.new }
        end
      end
    end
  end
end
