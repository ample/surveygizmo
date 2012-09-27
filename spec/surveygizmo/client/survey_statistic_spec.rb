require 'helper'

describe Surveygizmo::API do
  let(:client){ Surveygizmo::Client.new }

  describe "#survey_statistics" do
    before do
      stub_get("/v2/survey/1018301/surveystatistic").
       to_return(:body => fixture("survey_statistics.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_statistics){ client.survey_statistics(1018301) }

    it "requests the correct resource" do
      survey_statistics
      a_get("/v2/survey/1018301/surveystatistic").should have_been_made
    end

    describe "SurveyStatistic Collection" do
      it{ survey_statistics.should be_an Array }
      it{ survey_statistics.first.should be_a Surveygizmo::SurveyStatistic }
      it{ survey_statistics.first.id.should eq 3 }
    end
  end

  describe "#survey_statistic" do
    before do
      stub_get("/v2/survey/1018301/surveystatistic/1").
       to_return(:body => fixture("survey_statistic.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_statistic){ client.survey_statistic(1018301, 1) }

    it "requests the correct resource" do
      survey_statistic
      a_get("/v2/survey/1018301/surveystatistic/1").
        should have_been_made
    end

    describe "SurveyStatistic Object" do
      it{ survey_statistic.should be_a Surveygizmo::SurveyStatistic }
      it{ survey_statistic.id.should eq "[question(1)]" }
      it{ survey_statistic._type.should eq "SurveyStatistics" }
      it{ survey_statistic._subtype.should eq "instructions" }
    end
  end
end
