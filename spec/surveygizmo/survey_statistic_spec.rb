require 'helper'

describe Surveygizmo::SurveyStatistic do
  attributes = { 
    "_subtype" => "instructions",
    "_type" => "SurveyStatistics"
  }

  attributes.each_pair do |attribute, value|
    attribute = attribute.to_sym
    describe "##{attribute}" do
      it "returns a String when #{attribute} is set" do
        survey_statistic = Surveygizmo::SurveyStatistic.new(:id => "[question(3)]", attribute => value)
        survey_statistic.send(attribute).should eq value
      end
      it "returns nil when #{attribute} is not set" do
        survey_statistic = Surveygizmo::SurveyStatistic.new(:id => "[question(3)]")
        survey_statistic.send(attribute).should be_nil
      end
    end
  end
end