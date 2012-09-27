require 'surveygizmo/account'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo account
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-objects/account/
    module Account
      
      # Get details of authorized account
      # @param options [Hash] A customizable set of options.
      def account(options={})
        object_from_response(Surveygizmo::Account, :get, "account", options)
      end
      
    end
  end
end