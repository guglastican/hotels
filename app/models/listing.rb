class Listing < ApplicationRecord
  belongs_to :organization
  belongs_to :place

  has_many :images, as: :subject

  def default_image
    images.order(sort: :asc).first
  end
end
