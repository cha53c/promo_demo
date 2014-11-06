class CreateThemesTable < ActiveRecord::Migration
  def change
    create_table :themes_tables do |t|
      t.string :name
    end
  end
end
