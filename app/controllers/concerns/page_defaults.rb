module PageDefaults
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  protected
    def set_page_defaults
      @page = {}
      @page[:title] = 'Portfolio'
      @page[:keywords] = 'portfolio'
    end
end
