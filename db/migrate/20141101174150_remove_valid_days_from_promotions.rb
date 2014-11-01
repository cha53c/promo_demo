class RemoveValidDaysFromPromotions < ActiveRecord::Migration
  def up
    remove_column :promotions, :valid_days, :string
  end

  def down
    add_column :promotions, :valid_days, :string
  end
end
