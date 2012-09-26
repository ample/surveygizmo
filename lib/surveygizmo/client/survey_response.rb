require 'surveygizmo/survey_response'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey response
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-api-object-surveyresponse/
    module SurveyResponse
      
      # List all survey responses for a given survey
      # @param survey_id [Integer, String] Specify the survey to the responses to get
      def survey_responses(survey_id, options = {})
        get("survey/#{survey_id}/surveyresponse", options)
      end
      
      # Returns survey response details for a given id
      # @param survey_id [Integer, String] Specify the survey to the response to get
      # @param id [Integer, String] Specify the response to get
      def survey_response(survey_id, id, options={})
        object_from_response(Surveygizmo::SurveyResponse, :get, "survey/#{survey_id}/surveyresponse/#{id}", options)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
