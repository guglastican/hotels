module V1
  class ListingsController < BaseController
    before_action :set_listing, only: %i[ show images ]

    def show
    end

    def images
      @images = @listing.images.ordered
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
