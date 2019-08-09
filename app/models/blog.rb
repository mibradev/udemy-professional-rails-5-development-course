class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }

  belongs_to :topic

  has_many :comments, -> { order(created_at: :desc).limit(20) }, dependent: :destroy

  validates :title, :body, :topic_id, presence: true
end
