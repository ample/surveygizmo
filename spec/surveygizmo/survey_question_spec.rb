require 'helper'

describe Surveygizmo::SurveyQuestion do
  attributes = { 
    "_subtype" => "instructions",
    "_type" => "SurveyDecorative",
    "description" => [],
    "has_showhide_deps" => nil,
    "options" => [],
    "properties" => {},
    "shortname" => nil,
    "sub_question_skus" => nil,
    "title" => {},
    "varname" => nil
  }

  attributes.each_pair do |attribute, value|
    attribute = attribute.to_sym
    describe "##{attribute}" do
      it "returns a #{value.class} when #{attribute} is set" do
        survey_campaign = Surveygizmo::SurveyQuestion.new(:id => 3, attribute => value)
        survey_campaign.send(attribute).should eq value
      end
      it "returns nil when #{attribute} is not set" do
        survey_campaign = Surveygizmo::SurveyQuestion.new(:id => 3)
        survey_campaign.send(attribute).should be_nil
      end
    end
  end
end