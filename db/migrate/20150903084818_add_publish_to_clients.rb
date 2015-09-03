class AddPublishToClients < ActiveRecord::Migration
  def change
    add_column :clients, :publish, :boolean
  end
end
