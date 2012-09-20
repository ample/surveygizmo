require 'helper'

describe Surveygizmo::Request do
  subject { Surveygizmo::Client.new(:username => "maarten@moretea.nl", :password => "keyboardcat") }
  let(:survey_id) { 42 }
  let(:response_url) { "/v2/survey/#{survey_id}/surveyresponse" }

  describe "#request" do
    describe "filter parameter" do
      context "one parameter" do
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

        it "is convert to the correct params hash" do
          subject.survey_responses(survey_id, filter: { field: "datesubmitted", operator: ">=", value: "2012-01-01" })

          a_get(response_url).with(query: query).should have_been_made
        end
      end

      context "more than one parameter" do
        let(:query) {
          {
            "user:md5" => "maarten@moretea.nl:39f8d5313141b1f2bade311ba571537e",
            "filter[field][0]"    => "datesubmitted",
            "filter[operator][0]" => ">=",
            "filter[value][0]"    => "2012-01-01",
            "filter[field][1]"    => "datesubmitted",
            "filter[operator][1]" => "<=",
            "filter[value][1]"    => "2012-01-31",
          }
        }

        before do
          stub_get(response_url).with(query: query).
            to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
        end

        it "is convert to the correct params hash" do
          subject.survey_responses(survey_id, filter: [
            { field: "datesubmitted", operator: ">=", value: "2012-01-01" },
            { field: "datesubmitted", operator: "<=", value: "2012-01-31" }
          ])

          a_get(response_url).with(query: query).should have_been_made
        end
      end
    end
  end
end
