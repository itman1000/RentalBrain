class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token, :integer
    add_column :users, :evaluation, :integer
    add_column :users, :evaluation_count, :integer
  end
end
