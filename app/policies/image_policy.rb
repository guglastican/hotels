class ImagePolicy < ApplicationPolicy
  def manage?
    admin? || @user.organizations.include?(@record.organization)
  end

  def index?
    true
  end

  def create?
    manage?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if @user.admin?
        scope.all
      elsif @user.organization_user?
        scope.where(organization: @user.organizations)
      else
        scope.none
      end
    end
  end
end
