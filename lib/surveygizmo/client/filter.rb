module Surveygizmo
  class Client
    # Defines methods related to filtering search results
    # @see http://developer.surveygizmo.com/resources/filtering-and-browsing-results/
    module Filter
      
      # Format filters for the request querystring
      # TODO: Not yet recursive
      # @param filters [Hash] Filter(s) used to refine search
      def formatted_filters(filters = {})
        Hash[*filters.map{|key,value| ["filter[#{key}][0]", value]}.flatten]
      end
      
    end
  end
end