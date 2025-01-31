class CreateListingTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :listing_types do |t|
      t.string :title
      t.string :key

      t.timestamps
    end
  end
end
