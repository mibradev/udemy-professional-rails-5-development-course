class ApplicationController < ActionController::Base
  include DevisePermittedParameters
  include UtmParameters
  include PageDefaults
end
