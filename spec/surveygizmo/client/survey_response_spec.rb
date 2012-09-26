require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#survey_responses" do
    before do
     stub_get("/v2/survey/1018301/surveyresponse").
       to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_responses(1018301)
      a_get("/v2/survey/1018301/surveyresponse").
        should have_been_made
    end
    context "SurveyResponse collection" do
      subject(:survey_responses){ @client.survey_responses(1018301) }
      it{ survey_responses.should be_an Array }
      it{ survey_responses.first.should be_a Surveygizmo::SurveyResponse }
      it{ survey_responses.total_count.should eq 42 }
      it{ survey_responses.page.should eq 1 }
      it{ survey_responses.total_pages.should eq 2 }
      it{ survey_responses.results_per_page.should eq 21 }
    end
  end

  describe "#survey_response" do
    before do
     stub_get("/v2/survey/1018301/surveyresponse/1").
       to_return(:body => fixture("survey_response.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_response(1018301, 1)
      a_get("/v2/survey/1018301/surveyresponse/1").
        should have_been_made
    end
    context "SurveyResponse Object" do
      subject(:survey_response){ @client.survey_response(1018301, 1) }
      it{ survey_response.should be_a Surveygizmo::SurveyResponse }
      it{ survey_response.id.should eq 1 }
      it{ survey_response.contact_id.should eq "" }
      it{ survey_response.status.should eq "Complete" }
      it{ survey_response.is_test_data.should eq "1" }
      it{ survey_response.date_submitted.should eq Time.parse("2012-09-03 23:47:47") }
    end
  end
end