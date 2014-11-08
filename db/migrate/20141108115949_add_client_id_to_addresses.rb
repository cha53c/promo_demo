class AddClientIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :client_id, :integer
  end
end
