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

  has_many :custom_field_values, as: :subject, dependent: :destroy
  has_many :custom_fields, through: :custom_field_values
  has_many :images, as: :subject, dependent: :destroy
  has_many :listings

  accepts_nested_attributes_for :custom_field_values, reject_if: :reject_blank, allow_destroy: true

  validates :title, presence: true

  def default_image
    images.order(sort: :asc).first
  end

  private

    def reject_blank(attributes)
      if attributes[:value].blank?
        if attributes[:id].present?
          attributes.merge!({ _destroy: 1 }) && false
        else
          true
        end
      end
    end
end
