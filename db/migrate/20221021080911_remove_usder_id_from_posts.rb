class RemoveUsderIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :usder_id, :integer
  end
end
