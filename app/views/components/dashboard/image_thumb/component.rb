# frozen_string_literal: true

class Dashboard::ImageThumb::Component < ApplicationViewComponent
  option :image

  def render?
    image.file.attached?
  end
end
