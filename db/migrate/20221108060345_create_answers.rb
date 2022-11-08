class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.timestamps
      t.belongs_to :post, index: true, foreign_key: true
    end
  end
end
