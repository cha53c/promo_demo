class AddDetailsToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :details, :text
  end
end
