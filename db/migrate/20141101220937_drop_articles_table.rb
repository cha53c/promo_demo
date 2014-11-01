class DropArticlesTable < ActiveRecord::Migration
  def up
    drop_table :articles
  end

  def down
    create_table "articles", force: true do |t|
      t.string   "title"
      t.text     "text"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
