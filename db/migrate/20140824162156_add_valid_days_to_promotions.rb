class AddValidDaysToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :valid_days, :string
  end
end
