require 'surveygizmo/configuration'
require 'surveygizmo/connection'
require 'surveygizmo/request'
require 'surveygizmo/response'
require 'surveygizmo/error'

module Surveygizmo
  # @private
  class API
    include Connection
    include Request

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Surveygizmo.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
  end
end
