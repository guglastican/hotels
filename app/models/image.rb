class Image < ApplicationRecord
  belongs_to :organization
  belongs_to :subject, polymorphic: true

  has_one_attached :file

  scope :ordered, -> { order(sort: :asc) }
end
