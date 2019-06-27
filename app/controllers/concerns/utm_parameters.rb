module UtmParameters
  extend ActiveSupport::Concern

  included do
    before_action :set_utm_source
  end

  private
    def set_utm_source
      session[:utm_source] = params[:utm_source] if params[:utm_source]
    end
end
