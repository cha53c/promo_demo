class AddDefaultToClientPublishField < ActiveRecord::Migration
  def up
    change_column :clients, :publish, :boolean, default: false
  end

  def down
    change_column :clients, :publish, :boolean, default: nil
  end
end
