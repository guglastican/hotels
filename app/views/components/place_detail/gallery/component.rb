# frozen_string_literal: true

class PlaceDetail::Gallery::Component < ApplicationViewComponent
  option :place

  def images
    place.images.ordered.limit(4)
  end
end
