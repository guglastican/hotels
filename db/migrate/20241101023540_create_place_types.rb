class CreatePlaceTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :place_types do |t|
      t.string :title
      t.string :key

      t.timestamps
    end
  end
end
