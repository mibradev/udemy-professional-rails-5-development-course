class ApplicationController < ActionController::Base
  include DevisePermittedParameters
  include UtmParameters
end
