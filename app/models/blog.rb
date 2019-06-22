class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }

  belongs_to :topic

  validates :title, :body, presence: true
end
