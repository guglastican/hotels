class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :role
  end
end
