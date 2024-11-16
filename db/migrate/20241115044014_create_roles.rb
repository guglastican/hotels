class CreateRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :roles do |t|
      t.string :key
      t.string :title

      t.timestamps
    end
  end
end
