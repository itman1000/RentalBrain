class AddAnswerIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :answer, foreign_key: true
  end
end
