# frozen_string_literal: true

class Button::Component < ApplicationViewComponent
  option :data, default: proc { {} }
  option :disabled, default: proc { false }
  option :icon, default: proc { nil }
  option :icon_style, default: proc { "fa-regular" }
  option :method, default: proc { nil }
  option :path, default: proc { nil }
  option :should_render, default: proc { true }
  option :size, default: proc { :sm }
  option :variant, default: proc { :default }

  option :attributes, default: proc { {} }, type: -> {
    {
      autocomplete: "off",
      data: {},
      required: false,
    }.merge(_1)
  }

  # https://github.com/palkan/view_component-contrib#style-variants
  style do
    base {
      %w[
        border
        group/button
        inline-flex
        items-center
        justify-center
        rounded-lg
        shrink-0
      ]
    }
    variants {
      size {
        xs {
          %w[
            gap-1
            px-2
            py-1
            text-xs
          ]
        }
        sm_nopad {
          %w[
            gap-1
            text-xs
          ]
        }
        sm {
          %w[
            gap-1
            px-3
            py-2
            text-xs
          ]
        }
        md {
          %w[
            gap-2
            px-3
            py-2
            text-sm
          ]
        }
        md_nopad {
          %w[
            gap-2
            text-sm
          ]
        }
        lg {
          %w[
            gap-2
            px-4
            py-2
            text-base
          ]
        }
        lg_nopad {
          %w[
            gap-2
            text-base
          ]
        }
      }
      variant {
        primary {
          %w[
            border-button-primary-border
            bg-button-primary-background
            text-button-primary-text
          ]
        }
        outline {
          %w[
            border-button-outline-border
            text-button-outline-text
          ]
        }
        ghost {
          %w[
            border-none
            hover:text-button-outline-text
            text-text-secondary
          ]
        }
        link {
          %w[
            border-none
            hover:text-button-outline-text
            text-text-secondary
          ]
        }
      }
      disabled {
        yes {
          %w[
            opacity-50
            pointer-events-none
          ]
        }
      }
    }

    defaults {
      {
        disabled: false,
        size: :sm,
        variant: :primary,
      }
    }

    # The "compound" directive allows us to declare additional classes to add
    # when the provided combination is used
    # compound(variant: :outline, disabled: true) {
    #   %w[
    #     opacity-75
    #     bg-slate-300
    #   ]
    # }
  end

  def default_stimulus_controller
    component_identifier("Button")
  end

  def stimulus_controllers
    if attributes.dig(:data, :controller).present?
      return ([default_stimulus_controller] + attributes[:data][:controller].split).join(" ")
    end
    
    return default_stimulus_controller
  end

  def before_render
    attributes[:data].merge!({ controller: stimulus_controllers })
  end

  def form_method
    @method || attributes&.dig(:data, :turbo_method)
  end

  def render?
    should_render
  end
end
