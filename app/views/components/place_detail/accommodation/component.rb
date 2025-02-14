# frozen_string_literal: true

class PlaceDetail::Accommodation::Component < ApplicationViewComponent
  option :place

  def listings
    place.listings.limit(4)
  end

  def render?
    listings.present?
  end
end
