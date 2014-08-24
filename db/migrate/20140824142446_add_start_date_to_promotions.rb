class AddStartDateToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :starts, :date
  end
end
