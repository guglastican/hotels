class Listing < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_listings,
                  against: { title: "A", description: "B" },
                  using: {
                    tsearch: {
                      dictionary: "english",
                      prefix: true
                    }
                  }

  belongs_to :listing_type
  belongs_to :organization
  belongs_to :place

  has_many :custom_field_values, as: :subject, dependent: :destroy
  has_many :custom_fields, through: :custom_field_values
  has_many :images, as: :subject, dependent: :destroy

  def default_image
    images.order(sort: :asc).first
  end
end
