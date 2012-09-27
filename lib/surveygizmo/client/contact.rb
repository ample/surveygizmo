require 'surveygizmo/contact'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo contact
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-contact/
    module Contact
      
      # List all contacts
      # @param survey_id [Integer, String] Specify the survey
      # @param survey_campaign_id [Integer, String] Specify the campaign
      # @param options [Hash] A customizable set of options.
      # @option options [Integer, String] :resultsperpage Specify the number of results to return
      # @option options [Integer, String] :page Specify the result page number
      def contacts(survey_id, survey_campaign_id, options={})
        collection_from_response(Surveygizmo::Contact, :get, "survey/#{survey_id}/surveycampaign/#{survey_campaign_id}/contact", options)
      end
      
      # Returns contact details for a given id
      # @param survey_id [Integer, String] Specify the survey
      # @param survey_campaign_id [Integer, String] Specify the campaign
      # @param id [Integer, String] Specify the user
      # @param options [Hash] A customizable set of options.
      def contact(survey_id, survey_campaign_id, id, options={})
        object_from_response(Surveygizmo::Contact, :get, "survey/#{survey_id}/surveycampaign/#{survey_campaign_id}/contact/#{id}", options)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
