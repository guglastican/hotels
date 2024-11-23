# frozen_string_literal: true

class Dashboard::Listings::List::Component < ApplicationViewComponent
  option :listings, default: proc { Listing.none }
end
