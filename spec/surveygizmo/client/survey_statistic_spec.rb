require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#survey_statistics" do
    before do
      stub_get("/v2/survey/1018301/surveystatistic").
       to_return(:body => fixture("survey_statistics.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.survey_statistics(1018301)
      a_get("/v2/survey/1018301/surveystatistic").should have_been_made
    end
  end

  describe "#survey_statistic" do
    before do
      stub_get("/v2/survey/1018301/surveystatistic/1").
       to_return(:body => fixture("survey_statistic.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_statistic(1018301, 1)
      a_get("/v2/survey/1018301/surveystatistic/1").
        should have_been_made
    end
  end
end
