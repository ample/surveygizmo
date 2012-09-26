require 'surveygizmo/identity'
require 'surveygizmo/submittable'

module Surveygizmo
  class SurveyResponse < Surveygizmo::Identity
    include Surveygizmo::Submittable
    attr_reader :contact_id, :status, :is_test_data

  end
end
