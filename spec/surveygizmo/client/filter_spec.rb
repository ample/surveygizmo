require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#formatted_filters" do
    context "one filter" do
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

    context "more than one filters" do
      it "format filters for the request querystring" do
        filters = @client.formatted_filters(
          {
            "field" => "datesubmitted",
            "operator" => "<=",
            "value" => "2012-12-02"
          },
          {
            "field" => "status",
            "operator" => "=",
            "value" => "Active"
          }
        )

        filters.should == {
          "filter[field][0]"    => "datesubmitted",
          "filter[operator][0]" => "<=",
          "filter[value][0]"    => "2012-12-02",

          "filter[field][1]"    =>"status",
          "filter[operator][1]" =>"=",
          "filter[value][1]"    =>"Active"
      }
      end
    end
  end
end
