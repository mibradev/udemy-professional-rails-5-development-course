class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies

  after_initialize :set_defaults

  validates :title, :body, :main_image, :thumb_image, presence: true

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
