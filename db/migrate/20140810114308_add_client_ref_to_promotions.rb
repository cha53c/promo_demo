class AddClientRefToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :client, :reference
  end
end
