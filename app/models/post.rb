class Post < ApplicationRecord
  validates :title, { presence: true, length: {maximum: 30} }
  validates :content, { presence: true, length: {maximum: 3000} }
  validates :user_id, { presence: true }

  def user
    return User.find_by(id: self.user_id)
  end
end
