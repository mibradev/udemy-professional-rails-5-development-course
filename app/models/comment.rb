class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { maximum: 1000 }
end
