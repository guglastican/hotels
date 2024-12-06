# frozen_string_literal: true

class ListingDetail::Gallery::Component < ApplicationViewComponent
  option :listing

  def images
    listing.images.ordered.limit(4)
  end
end
