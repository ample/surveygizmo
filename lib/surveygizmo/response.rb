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

    def error_code
      @response.body.code.to_i
    end

    def error_message
      @response.body.message
    end

    # Build meta data access methods.
    [:result_ok, :total_count, :page, :total_pages, :results_per_page].each do |field|
      define_method field do
        @response.body.send(field).to_i
      end
    end

    def success?
      @response.body.result_ok
    end

    def failed?
      !success?
    end

    def ==(other)
      (self.data == other.data) && (self.result == other.result)
    end
  end
end
