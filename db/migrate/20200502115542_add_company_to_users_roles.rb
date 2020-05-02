class AddCompanyToUsersRoles < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_roles, :company
  end
end
