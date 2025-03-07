module V1
  class ListingsController < BaseController
    before_action :set_listing, only: %i[ show images ]

    def show
    end

    def images
      @images = @listing.images.ordered
    end

    def directory
      @listings = Listing.all

      # Listing Type
      if params[:listing_type_key].present? && (@listing_type = ListingType.find_by(key: params[:listing_type_key]))
        @listings = @listings.joins(:listing_type)
          .where(listing_type: @listing_type)
      end

      # Place Slug
      if params[:place_slug].present? && (@place = Place.find_by_slug(params[:place_slug]))
        @listings = @listings.joins(:place)
          .where(place: @place)
      end
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
