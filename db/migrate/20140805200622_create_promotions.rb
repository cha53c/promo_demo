class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.text :client
      t.text :type

      t.timestamps
    end
  end
end
