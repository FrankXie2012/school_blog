class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :motto, :text
    add_column :users, :hobby, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :classroom, :string
  end
end
