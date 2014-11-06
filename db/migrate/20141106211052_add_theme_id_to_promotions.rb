class AddThemeIdToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :theme_id, :integer
  end
end
