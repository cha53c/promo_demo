class AddContactDetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :email, :string
    add_column :clients, :tel, :string
    add_column :clients, :website, :string
  end
end
