require 'helper'

describe Surveygizmo::API do
  let(:client){ Surveygizmo::Client.new }

  describe "#survey_responses" do
    before do
     stub_get("/v2/survey/1018301/surveyresponse").
       to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_responses){ client.survey_responses(1018301) }

    it "requests the correct resource" do
      survey_responses
      a_get("/v2/survey/1018301/surveyresponse").
        should have_been_made
    end

    describe "SurveyResponse collection" do
      it{ survey_responses.should be_an Array }
      it{ survey_responses.first.should be_a Surveygizmo::SurveyResponse }
      it{ survey_responses.total_count.should eq 42 }
      it{ survey_responses.page.should eq 1 }
      it{ survey_responses.total_pages.should eq 2 }
      it{ survey_responses.results_per_page.should eq 21 }
    end

    context "with an authenticated filter query" do
      subject(:auth_client){ Surveygizmo::Client.new(:username => "maarten@moretea.nl", :password => "keyboardcat") }
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
        stub_get(response_url).
          with(:query => query).
          to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it "requests the correct resource" do
        auth_client.survey_responses(survey_id, filter: { field: "datesubmitted", operator: ">=", value: "2012-01-01" })
        a_get("/v2/survey/#{survey_id}/surveyresponse").
          with(:query => query).
          should have_been_made
      end
    end
    context "with 0 results_per_page" do
      before do
        stub_get("/v2/survey/1018301/surveyresponse").
          with(:query => {
            :resultsperpage => 0
          }).
          to_return(
            :body => fixture("survey_responses_with_0_results_per_page.json"), 
            :headers => {:content_type => "application/json; charset=utf-8"}
          )
      end

      subject(:survey_responses){ client.survey_responses(1018301, :resultsperpage => 0) }

      it "requests the correct resource" do
        survey_responses
        a_get("/v2/survey/1018301/surveyresponse").
          with(:query => {
            :resultsperpage => 0
          }).
          should have_been_made
      end

      describe "SurveyResponse collection" do
        it{ survey_responses.should be_an Array }
        it{ survey_responses.size.should eq 0 }
        it{ survey_responses.total_count.should eq 4406 }
        it{ survey_responses.page.should eq 1 }
        it{ survey_responses.total_pages.should eq 0 }
        it{ survey_responses.results_per_page.should eq 0 }
      end
    end
  end

  describe "#survey_response" do
    before do
     stub_get("/v2/survey/1018301/surveyresponse/1").
       to_return(:body => fixture("survey_response.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_response){ client.survey_response(1018301, 1) }

    it "requests the correct resource" do
      survey_response
      a_get("/v2/survey/1018301/surveyresponse/1").
        should have_been_made
    end

    context "SurveyResponse Object" do
      it{ survey_response.should be_a Surveygizmo::SurveyResponse }
      it{ survey_response.id.should eq 1 }
      it{ survey_response.contact_id.should eq "" }
      it{ survey_response.status.should eq "Complete" }
      it{ survey_response.is_test_data.should eq "1" }
      it{ survey_response.date_submitted.should eq Time.parse("2012-09-03 23:47:47") }
    end
  end
end