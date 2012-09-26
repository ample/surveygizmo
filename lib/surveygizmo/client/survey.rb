require 'surveygizmo/survey'

module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey
    # Polls, Quizzes, Forms, Registrations are all surveys with simple flags activated to change the behavior of the object
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-survey/
    module Survey
      
      # List all surveys, optionally filtered
      # @param options [Hash] Option(s) used to refine search
      def surveys(options = {})
        collection_from_response(Surveygizmo::Survey, :get, "survey", options)
      end
      
      # List all polls, optionally filtered
      # @param options [Hash] Option(s) used to refine search
      def polls(options = {})
        options[:filter] ||= []
        options[:filter] <<  { :field => 'subtype', :operator => '=', :value => 'Poll' }
        surveys(options)
      end
      
      # Returns survey details for a given id
      # @param id [Integer, String] A SurveyGizmo AccountUser ID
      # @param metaonly [Boolean] Return only meta data
      def survey(id, metaonly = false)
        object_from_response(Surveygizmo::Survey, :get, "survey/#{id}", :metaonly => metaonly)
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
