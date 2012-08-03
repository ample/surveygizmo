module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey statistics
    # @see http://developer.surveygizmo.com/rest-api-documentation/objects/surveystatistic/
    module SurveyStatistic

      # Returns survey statistic for a given question id
      # @param survey_id [Integer, String] Specify the survey to the response to get
      # @param question_id [Integer, String] Specify the question to get
      def survey_statistics(survey_id, question_id=nil)
        if question_id
          get("survey/#{survey_id}/surveystatistic/#{question_id}")
        else
          get("survey/#{survey_id}/surveystatistic")
        end
      end

    end
  end
end