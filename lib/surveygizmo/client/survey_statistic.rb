require 'surveygizmo/survey_statistic'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey statistic
    # @see http://developer.surveygizmo.com/rest-api-documentation/objects/surveystatistic/
    module SurveyStatistic

      # List all survey statistics for a given survey
      # @param survey_id [Integer, String] Specify the survey to the responses to get
      def survey_statistics(survey_id, options = {})
        get("survey/#{survey_id}/surveystatistic", options)
      end

      # Returns survey statstic details for a given id
      # @param survey_id [Integer, String] Specify the survey to the response to get
      # @param id [Integer, String] Specify the response to get
      def survey_statistic(survey_id, id)
        get("survey/#{survey_id}/surveystatistic/#{id}")
      end

      # TODO: Create, Update, Delete

    end
  end
end
