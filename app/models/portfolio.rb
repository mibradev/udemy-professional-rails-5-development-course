class Portfolio < ApplicationRecord
  has_many :technologies
  has_one_attached :main_image
  has_one_attached :thumb_image

  accepts_nested_attributes_for :technologies, reject_if: ->(attrs) { attrs[:name].blank? }

  validates :title, :body, presence: true
  validates :main_image, :thumb_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 2.megabytes }
end
