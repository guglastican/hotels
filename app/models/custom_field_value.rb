class CustomFieldValue < ApplicationRecord
  belongs_to :custom_field
  belongs_to :subject, polymorphic: true
end
