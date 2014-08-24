class AddEndDateToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :ends, :date
  end
end
