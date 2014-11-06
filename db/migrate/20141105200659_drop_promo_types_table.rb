class DropPromoTypesTable < ActiveRecord::Migration
  def up
    drop_table :promo_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
