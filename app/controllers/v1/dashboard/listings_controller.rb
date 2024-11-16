module V1
  module Dashboard
    class ListingsController < DashboardController
      
      def index
        @listings = policy_scope(Listing)
        authorize @listings
      end

    end
  end
end
