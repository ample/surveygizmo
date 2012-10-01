require 'helper'

describe Surveygizmo::Response do
  subject { Surveygizmo::Client.new(:username => "maarten@moretea.nl", :password => "keyboardcat") }
  let(:survey_id) { 42 }
  let(:response_url) { "/v2/survey/#{survey_id}/surveyresponse" }
  let(:query) {
    {
      "user:md5" => "maarten@moretea.nl:39f8d5313141b1f2bade311ba571537e",
      "filter[field][0]"    => "datesubmitted",
      "filter[operator][0]" => ">=",
      "filter[value][0]"    => "2012-01-01",
    }
  }

  before do
    stub_get(response_url).with(query: query).
      to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
  end

  let(:response) { subject.survey_responses(survey_id, filter: { field: "datesubmitted", operator: ">=", value: "2012-01-01" }) }


  context "#data" do
    it "is equal to the response object" do
      response.data.to_a == response.to_a
    end
  end

  context "#total_count" do
    it "returns the total number of results" do
      response.total_count.should == 42
    end
  end

  context "#page" do
    it "returns the current page" do
      response.page.should == 1
    end
  end

  context "#total_pages" do
    it "returns the total number of pages" do
      response.total_pages.should == 2
    end
  end

  context "#results_per_page" do
    it "returns the number of results per page" do
      response.results_per_page.should == 21
    end
  end

  context "#success?" do
    it "indicates the status of the response" do
      response.success?.should == true
    end
  end

end
