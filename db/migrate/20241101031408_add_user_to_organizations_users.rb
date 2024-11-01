class AddUserToOrganizationsUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :organizations_users, :user
  end
end
