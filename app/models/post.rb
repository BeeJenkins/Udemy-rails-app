class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy


validates :title, length: {minimum: 4, maximum: 50}

end
