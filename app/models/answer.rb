class Answer < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :post
end
