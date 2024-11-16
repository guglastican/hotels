class ListingPolicy < ApplicationPolicy

  def index?
    @user
  end

  # def manage?
  #   @record
  #   @user
  # end

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
