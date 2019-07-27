class ApplicationController < ActionController::Base
  include Pundit
  include DevisePermittedParameters
  include UtmParameters
  include PageDefaults
end
