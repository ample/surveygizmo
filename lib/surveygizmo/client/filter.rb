module Surveygizmo
  class Client
    # Defines methods related to filtering search results
    # @see http://developer.surveygizmo.com/resources/filtering-and-browsing-results/
    module Filter
      
      # Format filters for the request querystring
      # TODO: Not yet recursive
      def formatted_filters(filters = {})
        Hash[*filters.map{|key,value| ["filter[#{key}]", value]}.flatten]
      end
      
    end
  end
end