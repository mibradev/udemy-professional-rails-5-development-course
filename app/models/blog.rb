class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }

  belongs_to :topic

  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
end
