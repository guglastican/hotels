# frozen_string_literal: true

class ListingLayout::Component < ApplicationViewComponent
  renders_one :main_content, ListingLayout::MainContent::Component
  renders_one :right_sidebar, ListingLayout::RightSidebar::Component
end
