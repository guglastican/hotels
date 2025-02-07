# frozen_string_literal: true

class ImageGallery::Image::Component < ApplicationViewComponent
  option :image

  def render?
    image.file&.attached?
  end
end
