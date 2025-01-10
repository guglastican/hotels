# frozen_string_literal: true

class ListingDetail::Contact::Item::Component < ApplicationViewComponent
  option :label
  option :url, default: proc { nil }
  option :value

  def render?
    value.present?
  end
end
