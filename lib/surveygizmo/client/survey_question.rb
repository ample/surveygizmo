module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey question
    # @see http://developer.surveygizmo.com/rest-api-documentation/objects/surveyquestion/
    module SurveyQuestion

      # List all survey questions for a given survey
      # @param survey_id [Integer, String] Specify the survey for the questions to get
      def survey_questions(survey_id, options={})
        get("survey/#{survey_id}/surveyquestion", options)
      end

      # Returns survey question details for a given id
      # @param survey_id [Integer, String] Specify the survey for the question to get
      # @param question_id [Integer, String] Specify the question to get
      def survey_question(survey_id, question_id, options={})
        get("survey/#{survey_id}/surveyquestion/#{question_id}", options)
      end

      # TODO: Create, Update, Delete

    end
  end
end
