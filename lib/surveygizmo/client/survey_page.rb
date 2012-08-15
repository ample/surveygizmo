module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey page
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-surveypage/
    module SurveyPage
      
      # List all survey pages for a given survey
      # @param survey_id [Integer, String] Specify the survey to the pages to get
      def survey_pages(survey_id)
        get("survey/#{survey_id}/surveypage")
      end
      
      # Returns survey page details for a given id
      # @param survey_id [Integer, String] Specify the survey to the pages to get
      # @param id [Integer, String] Specify the page to get
      def survey_page(survey_id, id)
        get("survey/#{survey_id}/surveypage/#{id}")
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
