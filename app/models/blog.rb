class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }

  belongs_to :topic

  has_many :comments, dependent: :destroy
  has_rich_text :body

  validates :title, :body, presence: true
end
