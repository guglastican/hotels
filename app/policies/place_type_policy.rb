class PlaceTypePolicy < ApplicationPolicy

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
