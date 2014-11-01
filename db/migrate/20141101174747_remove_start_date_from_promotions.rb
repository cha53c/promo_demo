class RemoveStartDateFromPromotions < ActiveRecord::Migration
  def up
    remove_column :promotions, :start_date, :string
  end

  def down
    add_column :promotions, :start_date, :string
  end
end
