module V1
  module Dashboard
    class PlacesController < DashboardController
      before_action :set_place, only: %i[ edit update ]
      before_action :set_form_deps, only: %i[ new create edit update]

      def index
        @places = policy_scope(Place)
          .eager_load(:geo_region, :place_type)
          .order(title: :asc)
        authorize @places
      end

      def new
        @place = Place.new
        authorize @place
      end

      def create
        @place = Place.new(place_params)
        authorize @place

        if @place.save
          respond_to do |format|
            format.turbo_stream do
              redirect_path = params[:redirect].present? ? params[:redirect] : edit_v1_dashboard_place_path(@place)

              flash[:notice] = "Place was successfully created."
              turbo_actions = [
                turbo_stream.action(:redirect, redirect_path)
              ]

              render turbo_stream: turbo_actions
            end
          end
        else
          respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
          end
        end
      end

      def edit
        authorize @place
      end

      def update
        authorize @place

        if @place.update(place_params)
          respond_to do |format|
            format.turbo_stream do
              redirect_path = params[:redirect].present? ? params[:redirect] : v1_dashboard_places_path

              flash[:notice] = "Place was successfully updated."
              turbo_actions = [
                turbo_stream.action(:redirect, redirect_path)
              ]

              render turbo_stream: turbo_actions
            end
          end
        else
          respond_to do |format|
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end

      private

        def set_place
          @place = Place.eager_load(custom_field_values: :custom_field)
            .find(params[:id])
        end

        def set_form_deps
          @custom_fields = policy_scope(CustomField).where(subject_type: "Place")
          @place_types = policy_scope(PlaceType)
          @geo_regions = policy_scope(GeoRegion)
        end

        def place_params
          params.fetch(:place, {})
            .permit(
              :description,
              :geo_region_id,
              :place_type_id,
              :title,
              custom_field_values_attributes: [
                :custom_field_id,
                :id,
                :value
              ],
            )
        end
    end
  end
end
