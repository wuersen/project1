class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :email, :uniqueness => true, :presence => true
  validates :name, :uniqueness => true
end
