require 'surveygizmo/version'
require 'surveygizmo/client'
require 'surveygizmo/configurable'

module Surveygizmo
  class << self
    include Surveygizmo::Configurable

    # Alias for Surveygizmo::Client.new
    #
    # @return [Surveygizmo::Client]
    def new(options={})
      Surveygizmo::Client.new(options)
    end

    # Delegate to Surveygizmo::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
end

Surveygizmo.setup