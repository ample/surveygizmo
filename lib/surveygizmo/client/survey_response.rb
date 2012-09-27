require 'surveygizmo/survey_response'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey response
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-api-object-surveyresponse/
    module SurveyResponse
      
      # List all survey responses for a given survey
      # @param survey_id [Integer, String] Specify the survey to the responses to get
      # @param options [Hash] A customizable set of options.
      # @option options [Hash] :filter Option(s) used to refine search
      # @option options [Integer, String] :resultsperpage Specify the number of results to return
      # @option options [Integer, String] :page Specify the result page number
      def survey_responses(survey_id, options = {})
        collection_from_response(Surveygizmo::SurveyResponse, :get, "survey/#{survey_id}/surveyresponse", options)
      end
      
      # Returns survey response details for a given id
      # @param survey_id [Integer, String] Specify the survey to the response to get
      # @param id [Integer, String] Specify the response to get
      # @param options [Hash] A customizable set of options.
      def survey_response(survey_id, id, options={})
        object_from_response(Surveygizmo::SurveyResponse, :get, "survey/#{survey_id}/surveyresponse/#{id}", options)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
