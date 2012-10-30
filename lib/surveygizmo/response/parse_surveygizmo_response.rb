require 'faraday'
require 'surveygizmo/response'
 
module Surveygizmo
  class Response::ParseSurveygizmoResponse < Faraday::Response::Middleware
    class << self
      attr_accessor :response_class
    end
 
    self.response_class = Surveygizmo::Response
 
    def parse(body)
      self.class.response_class.new(body)
    end
  end
end