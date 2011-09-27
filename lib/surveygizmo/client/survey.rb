module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey
    # Polls, Quizzes, Forms, Registrations are all surveys with simple flags activated to change the behavior of the object
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-survey/
    module Survey
      
      # List all surveys, optionally filtered
      # @param filters [Hash] Filter(s) used to refine search
      def surveys(filters = {})
        get('survey', formatted_filters(filters))
      end
      
      # Temporary, until SG implements filtering by subtype
      def polls
        surveys.select { |s| s._subtype == 'Poll' }
      end
      
      # Returns survey details for a given id
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param metaonly [Boolean] Return only meta data
      def survey(id, metaonly = false)
        get("survey/#{id}", :metaonly => metaonly)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end