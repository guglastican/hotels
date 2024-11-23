class ListingPolicy < ApplicationPolicy

  def manage?
    admin? || @user.organizations.include?(@record.organization)
  end

  def index?
    @user
  end

  def new?
    @user
  end

  def create?
    manage?
  end

  def edit?
    manage?
  end

  def update?
    edit?
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
