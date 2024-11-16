# frozen_string_literal: true

class Dashboard::Places::List::Component < ApplicationViewComponent
  option :places, default: proc { Place.none }
end
