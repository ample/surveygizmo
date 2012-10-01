require 'helper'

describe Surveygizmo::API do
  let(:client) { Surveygizmo::Client.new }

  describe "#surveys" do
    before do
     stub_get("/v2/survey").
       to_return(:body => fixture("surveys.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.surveys
      a_get("/v2/survey").
        should have_been_made
    end
  end

  describe "#polls" do
    before do
     stub_get("/v2/survey?filter%5Bfield%5D%5B0%5D=subtype&filter%5Boperator%5D%5B0%5D==&filter%5Bvalue%5D%5B0%5D=Poll").
       to_return(:body => fixture("polls.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.polls
      a_get("/v2/survey?filter%5Bfield%5D%5B0%5D=subtype&filter%5Boperator%5D%5B0%5D==&filter%5Bvalue%5D%5B0%5D=Poll").
        should have_been_made
    end
    it "only returns surveys with a subtype of poll" do
      client.polls.each { |p| p._subtype.should == 'Poll' }
    end
  end

  describe "#survey" do
    before do
     stub_get("/v2/survey/1018301").
       with(:query => {:metaonly=>"false"}).
       to_return(:body => fixture("survey.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.survey(1018301)
      a_get("/v2/survey/1018301").
        with(:query => {:metaonly=>"false"}).
        should have_been_made
    end
  end
end
