module Surveygizmo
  class Collection < Array
    # Access Surveygizmo pagination variables
    attr_reader :total_count, :page, :total_pages, :results_per_page

    # Initializes a new Collection object
    #
    # @param klass [Class] The class to instantiate object in the collection
    # @param params [Hash]
    # @return [Array]
    def initialize(klass, params={})
      pagination_attributes.each do |attribute|
        value = params[attribute]
        instance_variable_set(:"@#{attribute}", !value.nil? ? value.to_i : value)
      end

      super(params[:data])

      map_klass(klass)
    end

    # Convience method to initialize a Collection
    def self.of(klass, params={})
      new(klass, params)
    end

    private

    # @return [Hash]
    def pagination_attributes
      [
        :total_count,
        :page,
        :total_pages,
        :results_per_page
      ]
    end

    # @return [Array]
    def map_klass(klass)
      self.map! do |element|
        klass.fetch_or_new(element)
      end      
    end
  end
end
