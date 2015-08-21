class AddDefaultRoleToUser < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, default: 'client'
  end

  def down
    change_column :users, :role, :string, nil
  end
end
