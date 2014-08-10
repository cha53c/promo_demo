class AddPromotionRefToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :promotion, index: true
  end
end