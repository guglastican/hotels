# frozen_string_literal: true

class SearchBox::Component < ApplicationViewComponent
  option :value, default: proc { "" }
end
