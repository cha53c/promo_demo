class AddDatesToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :start, :date
    add_column :promotions, :end, :date
  end
end
