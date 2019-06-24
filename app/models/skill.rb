class Skill < ApplicationRecord
  include Placeholder

  after_initialize :set_defaults

  validates :title, :percent_utilized, presence: true

  def set_defaults
    self.badge ||= Placeholder.image_generator(width: 250, height: 250)
  end
end
