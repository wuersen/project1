class Photo < ApplicationRecord
  has_many :comments
  belongs_to :user, :optional => true
end
