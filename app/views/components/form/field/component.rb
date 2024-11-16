# frozen_string_literal: true

class Form::Field::Component < ApplicationViewComponent
  renders_one :inline_button

  option :attribute_key, default: proc { nil }
  option :autocomplete, default: proc { "off" }
  option :field_options, default: proc { {} }
  option :field_type, default: proc { :text_field }
  option :form, default: proc { nil }
  option :hint, default: proc { nil }
  option :label, default: proc { "Label" }
  option :option_values, default: proc { [] }
  option :placeholder, default: proc { nil }
  option :select_options, default: proc { {} }
  option :value, default: proc { nil }

  style do
    base {
      %w[
        appearance-none
        bg-field-background
        block
        border
        border-field-border
        focus:bg-field-background-active
        focus:border-gray-500
        focus:outline-none
        leading-tight
        mb-3
        px-4
        py-3
        rounded
        text-text
        w-full
      ]
    }.freeze
  end
end
