class RemovePromottionRefToClients < ActiveRecord::Migration
  def change
    remove_reference :clients, :promotion, index: true
  end
end
