class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :promo_type
      t.string :start_date
      t.string :end_date
      t.references :client, index: true

      t.timestamps
    end
  end
end

