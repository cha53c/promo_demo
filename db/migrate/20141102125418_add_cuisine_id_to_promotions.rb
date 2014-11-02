class AddCuisineIdToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :cuisine_id, :integer
  end
end
