module Placeholder
  extend ActiveSupport::Concern

  class << self
    def image_generator(width:, height:)
      "https://via.placeholder.com/#{width}x#{height}"
    end
  end
end
