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
  end
end
