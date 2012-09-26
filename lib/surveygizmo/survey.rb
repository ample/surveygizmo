require 'surveygizmo/identity'
require 'surveygizmo/creatable'
require 'surveygizmo/modifiable'

module Surveygizmo
  class Survey < Surveygizmo::Identity
    include Surveygizmo::Creatable
    include Surveygizmo::Modifiable

    attr_reader :team, :_type, :_subtype, :status, :forward_only, :languages,
      :title, :internal_title, :title_ml, :theme, :blockby, :statistics, 
      :links, :pages
  end
end