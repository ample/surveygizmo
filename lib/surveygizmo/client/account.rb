module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo account
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-objects/account/
    module Account
      
      # Get details of authorized account
      def account
        get('account')
      end
      
    end
  end
end