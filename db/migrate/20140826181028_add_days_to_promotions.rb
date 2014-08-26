class AddDaysToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :mon, :boolean
    add_column :promotions, :tue, :boolean
    add_column :promotions, :wed, :boolean
    add_column :promotions, :thu, :boolean
    add_column :promotions, :fri, :boolean
    add_column :promotions, :sat, :boolean
    add_column :promotions, :sun, :boolean
  end
end
