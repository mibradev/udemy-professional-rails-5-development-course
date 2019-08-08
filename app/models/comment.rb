class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :content, :blog, presence: true
  validates :content, length: { maximum: 1000 }
end
