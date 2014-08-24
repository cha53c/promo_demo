class AddFromTimeToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :from, :time
  end
end
