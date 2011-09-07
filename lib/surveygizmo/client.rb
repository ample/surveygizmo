module Surveygizmo
  # Wrapper for the Surveygizmo REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-objects/ the Surveygizmo API Documentation}.
  # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'surveygizmo/client/account'
    require 'surveygizmo/client/account_user'
    require 'surveygizmo/client/filter'
    require 'surveygizmo/client/survey'

    alias :api_endpoint :endpoint

    include Surveygizmo::Client::Account
    include Surveygizmo::Client::AccountUser
    include Surveygizmo::Client::Filter
    include Surveygizmo::Client::Survey

  end
end