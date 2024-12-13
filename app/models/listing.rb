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

  belongs_to :organization
  belongs_to :place

  has_many :images, as: :subject

  def default_image
    images.order(sort: :asc).first
  end
end
