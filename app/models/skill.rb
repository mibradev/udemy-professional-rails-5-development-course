class Skill < ApplicationRecord
  after_initialize :set_defaults

  validates :title, :percent_utilized, presence: true

  def set_defaults
    self.badge ||= "https://via.placeholder.com/250x250"
  end
end
