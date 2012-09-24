require 'surveygizmo/configurable'

module Surveygizmo
  # Wrapper for the Surveygizmo REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/api-objects/ the Surveygizmo API Documentation}.
  # @see http://developer.surveygizmo.com/resources/rest-api-documentation-version-1-01/
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'surveygizmo/client/account'
    require 'surveygizmo/client/account_user'
    require 'surveygizmo/client/contact'
    require 'surveygizmo/client/filter'
    require 'surveygizmo/client/survey'
    require 'surveygizmo/client/survey_campaign'
    require 'surveygizmo/client/survey_response'
    require 'surveygizmo/client/survey_question'
    require 'surveygizmo/client/survey_statistic'

    include Surveygizmo::Configurable
    include Surveygizmo::Client::Account
    include Surveygizmo::Client::AccountUser
    include Surveygizmo::Client::Contact
    include Surveygizmo::Client::Filter
    include Surveygizmo::Client::Survey
    include Surveygizmo::Client::SurveyCampaign
    include Surveygizmo::Client::SurveyResponse
    include Surveygizmo::Client::SurveyQuestion
    include Surveygizmo::Client::SurveyStatistic
  end
end
