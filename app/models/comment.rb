class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 }
end
