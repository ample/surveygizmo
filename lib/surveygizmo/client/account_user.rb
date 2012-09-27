require 'surveygizmo/account_user'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo account user (not to be confused with a {Contact})
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-accountuser/
    module AccountUser
      
      # List all account users
      # @param options [Hash] A customizable set of options.
      def account_users(options={})
        collection_from_response(Surveygizmo::AccountUser, :get, "accountuser", options)
      end
      
      # Returns account user details for a given id
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param options [Hash] A customizable set of options.
      def account_user(id, options={})
        object_from_response(Surveygizmo::AccountUser, :get, "accountuser/#{id}", options)
      end
      
      # Create a new account user
      # @param options [Hash] A customizable set of options.
      # @option options [String] :email Specify the users email address
      # @option options [String] :username Specify the users password
      # @option options [String] :password Specify the users login username
      def create_account_user(options = {})
        object_from_response(Surveygizmo::AccountUser, :post, "accountuser?_method=PUT", options)
      end
      
      # Remove an account user
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param options [Hash] A customizable set of options.
      def delete_account_user(id, options={})
        object_from_response(Surveygizmo::AccountUser, :post, "accountuser/#{id}?_method=DELETE", options)
      end
      
      # Change an account user
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param options [Hash] A customizable set of options.
      # @option options [String] :email Specify the users email address
      # @option options [String] :username Specify the users password
      # @option options [String] :password Specify the users login username
      def update_account_user(id, options = {})
        object_from_response(Surveygizmo::AccountUser, :post, "accountuser/#{id}?_method=POST", options)
      end
      
    end
  end
end