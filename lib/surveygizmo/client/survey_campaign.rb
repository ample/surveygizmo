require 'surveygizmo/survey_campaign'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey campaign
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-surveycampaign/
    module SurveyCampaign
      
      # List all survey campaigns for a given survey
      # @param survey_id [Integer, String] Specify the survey to the campaigns to get
      # @param options [Hash] A customizable set of options.
      # @option options [Hash] :filter Option(s) used to refine search
      # @option options [Integer, String] :resultsperpage Specify the number of results to return
      # @option options [Integer, String] :page Specify the result page number
      def survey_campaigns(survey_id, options={})
        collection_from_response(Surveygizmo::SurveyCampaign, :get, "survey/#{survey_id}/surveycampaign", options)
      end
      
      # Returns survey campaign details for a given id
      # @param survey_id [Integer, String] Specify the survey to the campaigns to get
      # @param id [Integer, String] Specify the campaign to get
      # @param options [Hash] A customizable set of options.
      def survey_campaign(survey_id, id, options={})
        object_from_response(Surveygizmo::SurveyCampaign, :get, "survey/#{survey_id}/surveycampaign/#{id}", options)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end