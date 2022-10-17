class User < ApplicationRecord
  validates :name, {presence: true, uniqueness: true, length: {maximum: 30}}
  validates :email, {presence: true, uniqueness: true, length: {maximum: 30}}
  validates :password, {presence: true}

  has_one_attached :avatar
end
