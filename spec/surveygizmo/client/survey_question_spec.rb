require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#survey_questions" do
    before do
      stub_get("/v2/survey/1018301/surveyquestion").
       to_return(:body => fixture("survey_questions.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.survey_questions(1018301)
      a_get("/v2/survey/1018301/surveyquestion").should have_been_made
    end
    describe "SurveyQuestion collection" do
      subject(:survey_questions){ @client.survey_questions(1018301) }
      it{ survey_questions.should be_an Array }
      it{ survey_questions.first.should be_a Surveygizmo::SurveyQuestion }
      it{ survey_questions.first.id.should eq 3 }
    end
  end

  describe "#survey_question" do
    before do
      stub_get("/v2/survey/1018301/surveyquestion/1").
       to_return(:body => fixture("survey_question.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey_question(1018301, 1)
      a_get("/v2/survey/1018301/surveyquestion/1").
        should have_been_made
    end
    describe "SurveyQuestion object" do
      subject(:survey_question){ @client.survey_question(1018301, 1) }
      it{ survey_question.should be_a Surveygizmo::SurveyQuestion }
      it{ survey_question._subtype.should eq "instructions" }
      it{ survey_question._type.should eq "SurveyDecorative" }
      it{ survey_question.description.should eq [] }
      it{ survey_question.has_showhide_deps.should be_nil }
      it{ survey_question.id.should eq 3 }
      it{ survey_question.options.should eq [] }
      it{ survey_question.properties.should be_a_kind_of(Hash) }
      it{ survey_question.shortname.should be_nil }
      it{ survey_question.sub_question_skus.should be_nil }
      it{ survey_question.title.should be_a_kind_of(Hash) }
      it{ survey_question.varname.should be_nil }
    end
  end
end
