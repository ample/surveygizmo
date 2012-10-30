require 'digest/md5'

module Surveygizmo
  # @private
  module Connection

    private
      def connection(options= {})
        @connection ||= Faraday.new(@endpoint, @connection_options.merge(:builder => @middleware))
      end
  end
end