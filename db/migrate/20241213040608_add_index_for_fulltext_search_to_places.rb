class AddIndexForFulltextSearchToPlaces < ActiveRecord::Migration[7.2]
  disable_ddl_transaction!

  def change
    add_index :places, :searchable, using: :gin, algorithm: :concurrently
  end
end
