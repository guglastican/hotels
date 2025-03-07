module V1
  class HomeController < BaseController
    def index
      @featured_listings = Listing.all
        .order(updated_at: :desc)
        .limit(6)
    end

    def search
      @listings = Listing.all
      @places = Place.all

      # String
      if params[:string].present?
        @listings = @listings.search_listings(params[:string])
          .with_pg_search_rank

        @places = @places.search_places(params[:string])
          .with_pg_search_rank
      end

      # Combine Results
      @results = (@listings + @places).sort_by { |r| -r[:pg_search_rank] }
    end
  end
end
