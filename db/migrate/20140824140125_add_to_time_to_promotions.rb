class AddToTimeToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :to, :time
  end
end
