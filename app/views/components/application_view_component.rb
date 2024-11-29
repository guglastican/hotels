class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include ViewComponentContrib::StyleVariants

  class << self
    def component_name
      @component_name ||= name.sub(/::Component$/, "").underscore
    end

    def identifier
      @identifier ||= component_name.gsub("_", "-").gsub("/", "--")
    end

    def self.identifier
      identifier
    end
  end

  def component(name, ...)
    return super unless name.starts_with?(".")

    full_name = self.class.component_name + name.sub(".", "/")

    super(full_name, ...)
  end
end
