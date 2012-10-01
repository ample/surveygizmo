require 'helper'

describe Surveygizmo::API do
  let(:client) { Surveygizmo::Client.new }

  describe "#account_users" do
    before do
     stub_get("/v2/accountuser").
       to_return(:body => fixture("account_users.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.account_users
      a_get("/v2/accountuser").
        should have_been_made
    end
  end

  describe "#account_user" do
    before do
     stub_get("/v2/accountuser/183437").
       to_return(:body => fixture("account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.account_user(183437)
      a_get("/v2/accountuser/183437").
        should have_been_made
    end
  end

  describe "#create_account_user" do
    before do
     stub_post("/v2/accountuser").
       with(
        :body => {:email => "jamie@somewhere.com", :username => "Jamie", :password => "hamsterdance"},
        :query => {:_method => "PUT"}
       ).
       to_return(:body => fixture("create_account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.create_account_user({
        :email => "jamie@somewhere.com", 
        :username => "Jamie", 
        :password => "hamsterdance"
      })
      a_post("/v2/accountuser").
        with(
          :body => {:email => "jamie@somewhere.com", :username => "Jamie", :password => "hamsterdance"},
          :query => {:_method => "PUT"}
        ).
        should have_been_made
    end
  end

  describe "#delete_account_user" do
    before do
     stub_post("/v2/accountuser/183437").
       with(:query => {:_method => "DELETE"}).
       to_return(:body => fixture("delete_account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.delete_account_user(183437)
      a_post("/v2/accountuser/183437").
        with(:query => {:_method => "DELETE"}).
        should have_been_made
    end
  end

  describe "#update_account_user" do
    before do
     stub_post("/v2/accountuser/183437").
       with(:query => {:_method => "POST"}).
       to_return(:body => fixture("update_account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.update_account_user(183437, {:email => "jon@gmail.com"})
      a_post("/v2/accountuser/183437").
        with(:query => {:_method => "POST"}).
        should have_been_made
    end
  end
end
