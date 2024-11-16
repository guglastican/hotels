class PlacePolicy < ApplicationPolicy

  def index?
    admin?
  end

  def create?
    admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if @user&.admin?
        scope.all
      else
        scope.none
      end
    end
  end
end
