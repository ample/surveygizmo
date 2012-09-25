require 'surveygizmo/identity'
require 'surveygizmo/creatable'
require 'surveygizmo/modifiable'

module Surveygizmo
  class SurveyCampaign < Surveygizmo::Identity
    include Surveygizmo::Creatable
    include Surveygizmo::Modifiable

    attr_reader :_type, :_subtype, :__subtype, :status, :name, :SSL,
      :tokenvariables, :limit_responses, :close_message, :language
  end
end