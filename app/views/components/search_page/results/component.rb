# frozen_string_literal: true

class SearchPage::Results::Component < ApplicationViewComponent
  option :results, default: proc { [] }
end
