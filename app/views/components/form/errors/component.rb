# frozen_string_literal: true

class Form::Errors::Component < ApplicationViewComponent
  option :entity
  
  def render?
    entity.errors.any?
  end
end
