class RemoveAttrFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :attr, :integer
  end
end
