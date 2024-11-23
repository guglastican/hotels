module V1
  class HomeController < BaseController
    def index
      @featured_listings = Listing.all
        .order(updated_at: :desc)
        .limit(6)
    end
  end
end