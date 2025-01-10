class AddContactDetailsToListings < ActiveRecord::Migration[7.2]
  def change
    add_column :listings, :booking_url, :string
    add_column :listings, :website_url, :string
    add_column :listings, :instagram_url, :string
    add_column :listings, :facebook_url, :string
    add_column :listings, :phone, :string
    add_column :listings, :email, :string
  end
end
