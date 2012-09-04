require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#formatted_filters" do
    it "format filters for the request querystring" do
      filters = @client.formatted_filters({
        "field" => "status",
        "operator" => "=",
        "value" => "Active"
      })
      filters.should == {
        "filter[field][0]"=>"status", 
        "filter[operator][0]"=>"=", 
        "filter[value][0]"=>"Active"
      } 
    end
  end
end