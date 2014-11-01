class DropCommentsTable < ActiveRecord::Migration
  def up
    drop_table :comments
  end

  def down
    create_table "comments", force: true do |t|
      t.string   "commenter"
      t.text     "body"
      t.integer  "article_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
