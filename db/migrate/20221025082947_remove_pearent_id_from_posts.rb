class RemovePearentIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :pearent_id, :integer
  end
end
