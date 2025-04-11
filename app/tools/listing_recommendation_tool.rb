class ListingRecommendationTool < RubyLLM::Tool
  description "Provides suggestions for places to stay in a specific location"

  param :location, desc: "A name of a town (e.g. Kiama)"

  def execute(location:)
    places = Place.all.search_places(location)

    listings = Listing.joins(:listing_type, :place)
      .where(listing_types: { key: "accommodation"  })
      .where(places: { id: places })

    listings.to_json(only: [ :title, :description ])
  end
end
