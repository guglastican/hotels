# frozen_string_literal: true

class Form::Success::Component < ApplicationViewComponent
  option :notice, default: proc { nil }

  def render?
    notice.present?
  end
end
