class User < ApplicationRecord
  attr_accessor :token

  has_secure_password

  has_many :posts, dependent: :destroy

  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, presence: true
end
