require 'surveygizmo/identity'

module Surveygizmo
  class SurveyQuestion < Surveygizmo::Identity
    attr_reader :_subtype, :_type, :description, 
      :has_showhide_deps, :id, :options, :properties, 
      :shortname, :sub_question_skus, :title, :varname
  end
end