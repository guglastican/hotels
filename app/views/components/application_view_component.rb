class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include ViewComponentContrib::StyleVariants
end
