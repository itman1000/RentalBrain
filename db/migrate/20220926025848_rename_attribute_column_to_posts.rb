class RenameAttributeColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :attribute, :attr
  end
end
