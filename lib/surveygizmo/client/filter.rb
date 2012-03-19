module Surveygizmo
  class Client
    # Defines methods related to filtering search results
    # @see http://developer.surveygizmo.com/resources/filtering-and-browsing-results/
    module Filter
      
      # Format filters for the request querystring
      # Example: [{field:'type',operator:'=',value:'Poll'},{field:'title',operator:'=',value:'Test Poll'}]
      # TODO: Not yet recursive
      # @param filters [Hash] Filter(s) used to refine search
      def formatted_filters(filters = [])
        Hash[*filters.each_with_index.map {|filter,idx| filter.map{|key,value| ["filter[#{key}][#{idx}]", value]} }.flatten]
      end
      
    end
  end
end