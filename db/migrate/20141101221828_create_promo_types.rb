class CreatePromoTypes < ActiveRecord::Migration
  def change
    create_table :promo_types do |t|
      t.string :promo_type
    end
  end
end
