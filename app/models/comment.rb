class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, length: {minimum: 4, maximum: 150}

end
