class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :commit, :integer
    add_column :posts, :reward, :integer
    add_column :posts, :private, :boolean
  end
end
