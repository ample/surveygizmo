module Surveygizmo
  class Client
    # Defines methods related to a SurveyGizmo survey campaign
    # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-object-surveycampaign/
    module SurveyCampaignEmailMessage
      
      # List all survey campaigns for a given survey
      # @param survey_id [Integer, String] Specify the survey to the campaigns to get
      def survey_campaign_emailmessages(survey_id, survey_campaign_id)
        get("survey/#{survey_id}/surveycampaign")
        get("survey/#{survey_id}/surveycampaign/#{id}/emailmessage/")
      end
      
      # Returns survey campaign details for a given id
      # @param survey_id [Integer, String] Specify the survey to the campaigns to get
      # @param id [Integer, String] Specify the campaign to get
      def survey_campaign_emailmessage(survey_id, survey_campaign_id, id)
        get("survey/#{survey_id}/surveycampaign/#{survey_campaign_id}/emailmessage/#{id}")
      end
      
      # TODO: Create, Update, Delete
      
    end
  end
end
