# frozen_string_literal: true

class SearchPage::Listings::Component < ApplicationViewComponent
  option :listings, default: proc { Listing.none }

  def render?
    listings.any?
  end
end
