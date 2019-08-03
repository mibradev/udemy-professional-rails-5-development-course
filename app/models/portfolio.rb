class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies
  has_one_attached :main_image
  has_one_attached :thumb_image

  accepts_nested_attributes_for :technologies, reject_if: ->(attrs) { attrs[:name].blank? }

  after_initialize :set_defaults

  validates :title, :body, presence: true
  validates :main_image, :thumb_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 2.megabytes }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
