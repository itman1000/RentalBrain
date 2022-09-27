class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :attribute
      t.integer :pearent_id

      t.timestamps
    end
  end
end
