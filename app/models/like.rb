class Like < ApplicationRecord
  belongs_to :answer

  validates :user_id, {presence: true, uniqueness: true}
end
