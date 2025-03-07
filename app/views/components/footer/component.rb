# frozen_string_literal: true

class Footer::Component < ApplicationViewComponent
  def popular_places
    Listing
      .joins(:listing_type, :place)
      .select("
        places.id AS place_id,
        places.title AS place_title,
        listing_types.key AS listing_type_key,
        listing_types.title AS listing_type_title
      ")
      .group("places.id, listing_types.id")
      .having("COUNT(listings.id) > 0")
      .order("COUNT(listings.id) DESC")
  end
end
