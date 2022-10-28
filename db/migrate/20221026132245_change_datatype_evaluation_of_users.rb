class ChangeDatatypeEvaluationOfUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :evaluation, :decimal, precision: 2, scale: 1
  end
end
