module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo contact
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-contact/
    module Contact

      # List all contacts
      # @param survey_id [Integer, String] Specify the survey
      # @param survey_campaign_id [Integer, String] Specify the campaign
      def contacts(survey_id, survey_campaign_id, options = {})
        get("survey/#{survey_id}/surveycampaign/#{survey_campaign_id}/contact", options)
      end

      # Returns contact details for a given id
      # @param survey_id [Integer, String] Specify the survey
      # @param survey_campaign_id [Integer, String] Specify the campaign
      # @param id [Integer, String] Specify the user
      def contact(survey_id, survey_campaign_id, id)
        get("survey/#{survey_id}/surveycampaign/#{survey_campaign_id}/contact/#{id}")
      end

      # TODO: Create, Update, Delete

    end
  end
end
