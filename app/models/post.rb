class Post < ApplicationRecord
  has_one :answer, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, { presence: true, length: {maximum: 50} }
  validates :content, { presence: true, length: {maximum: 3000} }
  validates :user_id, { presence: true }
  validates :reward, { presence: true }

  def user
    return User.find_by(id: self.user_id)
  end
end
