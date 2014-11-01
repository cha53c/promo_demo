class RemoveEndDateFromPromotions < ActiveRecord::Migration
  def up
    remove_column :promotions, :end_date, :string
  end

  def down
    add_column :promotions, :end_date, :string
  end
end
