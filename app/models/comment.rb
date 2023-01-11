class Comment < ApplicationRecord
  belongs_to :post

  def user
    return User.find_by(id: self.user_id)
  end
end
