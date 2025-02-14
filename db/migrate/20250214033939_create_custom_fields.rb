class CreateCustomFields < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_fields do |t|
      t.string :key, null: false, index: { unique: true }
      t.string :title
      t.string :description
      t.string :subject_type

      t.timestamps
    end
  end
end
