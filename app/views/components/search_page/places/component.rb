# frozen_string_literal: true

class SearchPage::Places::Component < ApplicationViewComponent
  option :places, default: proc { Place.none }
end
