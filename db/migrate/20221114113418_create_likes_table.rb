class CreateLikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
      t.belongs_to :answer, index: true, foreign_key: true
    end
  end
end
