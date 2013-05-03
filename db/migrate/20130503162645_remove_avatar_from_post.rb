class RemoveAvatarFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :avatar
  end

  def down
    add_column :posts, :avatar, :string
  end
end
