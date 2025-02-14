# frozen_string_literal: true

class PlaceDetail::CustomFields::Component < ApplicationViewComponent
  option :place

  def custom_field_values
    place.custom_field_values.sort_by { |v| v.custom_field.title }
  end

  def render?
    custom_field_values.present?
  end
end
