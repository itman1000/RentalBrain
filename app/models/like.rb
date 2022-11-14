class Like < ApplicationRecord
  belongs_to :answer

  validates :user_id, {presence: true}
  validates :post_id, {presence: true}
end
