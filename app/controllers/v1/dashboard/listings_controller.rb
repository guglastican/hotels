module V1
  module Dashboard
    class ListingsController < DashboardController
      before_action :set_listing, only: %i[ edit update ]
      before_action :set_form_deps, only: %i[ new create edit update ]

      def index
        @listings = policy_scope(Listing)
        authorize @listings
      end

      def new
        @listing = Listing.new
        authorize @listing
      end

      def create
        @listing = Listing.new(listing_params)
        @listing.organization = Current.user.default_organization
        authorize @listing

        if @listing.save
          respond_to do |format|
            format.turbo_stream do
              redirect_path = params[:redirect].present? ? params[:redirect] : edit_v1_dashboard_listing_path(@listing)

              flash[:notice] = "Listing was successfully created."
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
        authorize @listing
      end

      def update
        authorize @listing

        if @listing.update(listing_params)
          respond_to do |format|
            format.turbo_stream do
              redirect_path = params[:redirect].present? ? params[:redirect] : v1_dashboard_listings_path

              flash[:notice] = "Listing was successfully updated."
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

        def set_listing
          @listing = Listing.find(params[:id])
        end

        def set_form_deps
          @places = policy_scope(Place).joins(:place_type)
            .where(place_types: { key: "town" })
            .order(title: :asc)
        end

        def listing_params
          params.fetch(:listing, {})
            .permit(
              :booking_url,
              :description,
              :email,
              :facebook_url,
              :instagram_url,
              :phone,
              :place_id,
              :title,
              :website_url,
            )
        end
    end
  end
end
