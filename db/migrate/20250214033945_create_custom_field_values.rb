class CreateCustomFieldValues < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_field_values do |t|
      t.belongs_to :custom_field
      t.belongs_to :subject, polymorphic: true
      t.string :value

      t.timestamps
    end
  end
end
