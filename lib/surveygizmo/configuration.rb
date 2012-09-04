require 'surveygizmo/version'

module Surveygizmo
  # Defines constants and methods related to configuration
  module Configuration
    
    # An array of valid keys in the options hash when configuring a {Surveygizmo::API}
    VALID_OPTIONS_KEYS = [
      :username,
      :password,
      :endpoint,
      :user_agent].freeze
     
    # There is no default
    DEFAULT_USERNAME = nil
    
    # There is no default
    DEFAULT_PASSWORD = nil
    
    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'https://restapi.surveygizmo.com/v2/'.freeze

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Surveygizmo Ruby Gem #{Surveygizmo::VERSION}".freeze
    
    # @private
    attr_accessor *VALID_OPTIONS_KEYS
    
    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.endpoint           = DEFAULT_ENDPOINT
      self.username           = DEFAULT_USERNAME
      self.password           = DEFAULT_PASSWORD
      self.user_agent         = DEFAULT_USER_AGENT
      self
    end
    
  end
end