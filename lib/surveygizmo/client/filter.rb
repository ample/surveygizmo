module Surveygizmo
  class Client
    # Defines methods related to filtering search results
    # @see http://developer.surveygizmo.com/resources/filtering-and-browsing-results/
    module Filter

      # Format filters for the request querystring
      # TODO: Not yet recursive
      # @param filters [Hash] Filter(s) used to refine search
      def formatted_filters(*filters)
        filters.flatten!
        if filters.nil? || filters.empty? || filters.first.nil?
          {}
        else
          {}.tap do |params|
            filters.each_with_index do |filter, index|
              filter.each { |key, value| params["filter[#{key}][#{index}]"] = value }
            end
          end
        end
      end

    end
  end
end
