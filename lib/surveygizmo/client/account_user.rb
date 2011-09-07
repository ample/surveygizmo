module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo account user (not to be confused with a {Contact})
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-accountuser/
    module AccountUser
      
      # List all account users
      def account_users
        get('accountuser')
      end
      
      # Returns account user details for a given id
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      def account_user(id)
        get("accountuser/#{id}")
      end
      
      # Create a new account user
      # @param options [Hash] provide the :email, :username and :password
      def create_account_user(options = {})
        post('accountuser?_method=PUT', options)
      end
      
      # Remove an account user
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      def delete_account_user(id)
        post("accountuser/#{id}?_method=DELETE")
      end
      
      # Change an account user
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param options [Hash] provide the :email, :username and :password
      def update_account_user(id, options = {})
        post("accountuser/#{id}?_method=POST", options)
      end
      
    end
  end
end