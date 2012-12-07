module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey option
    # @see http://developer.surveygizmo.com/rest-api-documentation/objects/surveyoption/
    module SurveyOption

      # List all survey options for a given survey
      # @param survey_id [Integer, String] Specify the survey for the options to get
      def survey_options(survey_id, survey_page_id, question_id, options = {})
        get("survey/#{survey_id}/surveypage/#{survey_page_id}/surveyquestion/#{question_id}/surveyoption", options)
      end

      # Returns survey option details for a given id
      # @param survey_id [Integer, String] Specify the survey for the option to get
      # @param option_id [Integer, String] Specify the option to get
      def survey_option(survey_id, survey_page_id, question_id, id, options = {})
        get("survey/#{survey_id}/surveypage/#{survey_page_id}/surveyquestion/#{question_id}/surveyoption/#{id}", options)
      end

      # TODO: Create, Update, Delete

    end
  end
end
