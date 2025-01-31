class AddListingTypeToListings < ActiveRecord::Migration[7.2]
  def change
    add_reference :listings, :listing_type
  end
end
