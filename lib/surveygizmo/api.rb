require 'surveygizmo/configurable'
require 'surveygizmo/connection'
require 'surveygizmo/request'
require 'surveygizmo/response'
require 'surveygizmo/error'
require 'surveygizmo/collection'

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

    # @param klass [Class]
    # @param request_method [Symbol]
    # @param url [String]
    # @param options [Hash]
    # @return [Object]
    def object_from_response(klass, request_method, url, options={})
      klass.from_response(send(request_method.to_sym, url, options))
    end

    # @param klass [Class]
    # @param request_method [Symbol]
    # @param url [String]
    # @param params [Hash]
    # @param options [Hash]
    # @return [Array]
    def collection_from_response(klass, request_method, url, options={})
      Surveygizmo::Collection.of(klass, send(request_method.to_sym, url, options).body)
    end
  end
end
