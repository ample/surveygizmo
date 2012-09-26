module Surveygizmo
  class Collection < Array
    attr_reader :total_count, :page, :total_pages, :results_per_page

    def initialize(klass, params={})
      pagination_attributes.each do |attribute|
        value = params[attribute]
        instance_variable_set(:"@#{attribute}", !value.nil? ? value.to_i : value)
      end

      super(params[:data])

      map_klass(klass)
    end

    def self.of(klass, params={})
      new(klass, params)
    end

    private
    def pagination_attributes
      [
        :total_count,
        :page,
        :total_pages,
        :results_per_page
      ]
    end
    def map_klass(klass)
      self.map! do |element|
        klass.fetch_or_new(element)
      end      
    end
  end
end
