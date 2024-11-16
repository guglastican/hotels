# frozen_string_literal: true

class DashboardLayout::ContentContainer::Component < ApplicationViewComponent
  renders_one :content_container
  renders_one :header_content, DashboardLayout::PageHeader::Component
  renders_one :main_content, DashboardLayout::MainContent::Component
end
