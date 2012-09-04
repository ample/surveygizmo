require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#survey_responses" do
    before do
     stub_get("/v1/survey/1018301/surveyresponse").
       to_return(:body => fixture("survey_responses.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_responses(1018301)
      a_get("/v1/survey/1018301/surveyresponse").
        should have_been_made
    end
  end

  describe "#survey_response" do
    before do
     stub_get("/v1/survey/1018301/surveyresponse/1").
       to_return(:body => fixture("survey_response.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_response(1018301, 1)
      a_get("/v1/survey/1018301/surveyresponse/1").
        should have_been_made
    end
  end
end