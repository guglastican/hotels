module V1
  class ListingsController < BaseController
    before_action :set_listing, only: %i[ show gallery ]

    def show
    end

    def gallery
    end

    private

      def set_listing
        @listing = Listing.eager_load(
          :listing_type,
          :place,
        )
          .find(params[:id])
      end
  end
end
