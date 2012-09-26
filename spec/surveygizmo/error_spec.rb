require 'helper'

describe Surveygizmo::Error do
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
      to_return(:body => fixture("error.json"), :headers => {:content_type => "application/json; charset=utf-8"})
  end

  let(:request) { subject.survey_responses(survey_id, filter: { field: "datesubmitted", operator: ">=", value: "2012-01-01" }) }

  it "throws an Surveygizmo::Error" do
    expect { request }.to raise_error Surveygizmo::Error
  end

  it "has the correct code" do
    expect { request }.to raise_error(Surveygizmo::Error) { |e| e.code.should == 103 }
  end

  it "has the correct message" do
    expect { request }.to raise_error(Surveygizmo::Error) { |e| e.message.should == "Service currently unavailable" }
  end
end
