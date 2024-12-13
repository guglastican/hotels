class Place < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_places,
                  against: { title: "A", description: "B" },
                  using: {
                    tsearch: {
                      dictionary: "english",
                      prefix: true
                    }
                  }

  belongs_to :place_type
  belongs_to :geo_region

  has_many :listings
  has_many :images, as: :subject

  validates :title, presence: true

  def default_image
    images.order(sort: :asc).first
  end
end
