require 'hashie'
module Surveygizmo
  class Response
    attr_reader :response
    attr_reader :data

    def initialize(response)
      @response = parse(response)
      @data     = @response.data
    end

    def method_missing(name, *arguments, &block)
      @data.send(name, *arguments, &block)
    end

    # Build meta data access methods.
    [:total_count, :page, :total_pages, :results_per_page].each do |field|
      define_method field do
        @response.send(field).to_i
      end
    end

    def success?
      @response.result_ok
    end

    def ==(other)
      (self.data == other.data) && (self.result == other.result)
    end

    private
    def mash_class
      Hashie::Mash
    end

    def parse(body)
      case body
      when Hash
        mash_class.new(body)
      when Array
        body.map { |item| parse(item) }
      else
        body
      end
    end
  end
end