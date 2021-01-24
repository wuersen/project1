class User < ApplicationRecord
  has_many :photos
  has_many :comments
  has_secure_password
  validates :email, :uniqueness => true, :presence => true
  validates :name, :uniqueness => true
end
