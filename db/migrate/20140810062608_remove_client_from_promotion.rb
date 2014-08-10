class RemoveClientFromPromotion < ActiveRecord::Migration
  def change
    remove_column :promotions, :client, :text
  end
end
