class ListingTypePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if @user
        scope.all
      else
        scope.none
      end
    end
  end
end
