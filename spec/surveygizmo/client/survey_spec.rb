require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#surveys" do
    before do
     stub_get("/v2/survey").
       to_return(:body => fixture("surveys.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.surveys
      a_get("/v2/survey").
        should have_been_made
    end
  end

  describe "#polls" do
    before do
     stub_get("/v2/survey").
       to_return(:body => fixture("surveys.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.polls
      a_get("/v2/survey").
        should have_been_made
    end
  end

  describe "#survey" do
    before do
     stub_get("/v2/survey/1018301").
       with(:query => {:metaonly=>"false"}).
       to_return(:body => fixture("survey.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.survey(1018301)
      a_get("/v2/survey/1018301").
        with(:query => {:metaonly=>"false"}).
        should have_been_made
    end
  end
end