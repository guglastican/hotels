module V1
  class PlacesController < BaseController
    before_action :set_place, only: %i[ show images ]

    def show
    end

    def images
      @images = @place.images.ordered
    end

    private

      def set_place
        @place = Place.eager_load(
          :geo_region,
          :place_type,
          custom_field_values: :custom_field,
        )
          .find(params[:id])
      end
  end
end
