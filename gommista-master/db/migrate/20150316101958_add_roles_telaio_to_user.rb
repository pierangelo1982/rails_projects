class AddRolesTelaioToUser < ActiveRecord::Migration
  def change
    add_column :users, :roles, :string
  end
end
