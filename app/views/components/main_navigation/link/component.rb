# frozen_string_literal: true

class MainNavigation::Link::Component < ApplicationViewComponent
  option :path
  option :should_render, default: proc { true }
  option :title

  def render?
    should_render
  end
end
