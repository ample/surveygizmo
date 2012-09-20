module Surveygizmo
  class Response
    attr_reader :response
    attr_reader :data

    def initialize(response)
      @response = response
      @data     = response.body.data
    end

    def method_missing(name, *arguments, &block)
      @data.send(name, *arguments, &block)
    end

    # Build meta data access methods.
    [:result_ok, :total_count, :page, :total_pages, :results_per_page].each do |field|
      define_method field do
        @response.body.send(field).to_i
      end
    end

    alias_method :result_ok?, :result_ok

    def == other
      (self.data == other.data) && (self.result == other.result)
    end
  end
end
