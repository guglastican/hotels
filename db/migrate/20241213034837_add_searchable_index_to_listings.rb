class AddSearchableIndexToListings < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    add_index :listings, :searchable, using: :gin, algorithm: :concurrently
  end
end
