require 'surveygizmo/configurable'
require 'surveygizmo/connection'
require 'surveygizmo/request'
require 'surveygizmo/response'
require 'surveygizmo/error'

module Surveygizmo
  # @private
  class API
    include Surveygizmo::Configurable
    include Connection
    include Request

    # Creates a new API
    def initialize(options={})
      Surveygizmo::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Surveygizmo.instance_variable_get(:"@#{key}"))
      end
    end
  end
end
