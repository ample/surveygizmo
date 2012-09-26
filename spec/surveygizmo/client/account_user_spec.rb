require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#account_users" do
    before do
     stub_get("/v2/accountuser").
       to_return(:body => fixture("account_users.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.account_users
      a_get("/v2/accountuser").
        should have_been_made
    end
    describe "AccountUser Collection" do
      subject(:account_users){ @client.account_users }
      it{ account_users.should be_an Array }
      it{ account_users.first.should be_a Surveygizmo::AccountUser }
      it{ account_users.first.id.should eq 183437 }
    end
  end

  describe "#account_user" do
    before do
     stub_get("/v2/accountuser/183437").
       to_return(:body => fixture("account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.account_user(183437)
      a_get("/v2/accountuser/183437").
        should have_been_made
    end
    describe "AccountUser Object" do
      subject(:account_user){ @client.account_user(183437) }
      it{ account_user.should be_a Surveygizmo::AccountUser }
      it{ account_user.id.should eq 183437 }
      it{ account_user._type.should eq "AccountUser" }
      it{ account_user.username.should eq "Jon" }
      it{ account_user.email.should eq "jon@somewhere.com" }
      it{ account_user.status.should eq "Active" }
      it{ account_user.last_login.should eq Time.parse("2012-07-05 18:24:02") }
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
      @client.create_account_user({
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
    describe "AccountUser Object" do
      subject(:account_user){ 
        @client.create_account_user({
          :email => "jamie@somewhere.com", 
          :username => "Jamie", 
          :password => "hamsterdance"
        }) 
      }
      it{ account_user.should be_a Surveygizmo::AccountUser }
      it{ account_user.id.should eq 183438 }
      it{ account_user._type.should eq "AccountUser" }
      it{ account_user.username.should eq "Jamie" }
      it{ account_user.email.should eq "jamie@somewhere.com" }
      it{ account_user.status.should eq "Active" }
      it{ account_user.last_login.should eq Time.parse("2012-07-05 18:24:02") }
    end
  end

  describe "#delete_account_user" do
    before do
     stub_post("/v2/accountuser/183437").
       with(:query => {:_method => "DELETE"}).
       to_return(:body => fixture("delete_account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.delete_account_user(183437)
      a_post("/v2/accountuser/183437").
        with(:query => {:_method => "DELETE"}).
        should have_been_made
    end
    describe "AccountUser Object" do
      subject(:account_user){ @client.delete_account_user(183437) }
      it{ account_user.should be_a Surveygizmo::AccountUser }
      it{ account_user.id.should eq 183438 }
      it{ account_user._type.should eq "AccountUser" }
      it{ account_user.username.should eq "Jamie" }
      it{ account_user.email.should eq "jamie@somewhere.com" }
      it{ account_user.status.should eq "Active" }
      it{ account_user.last_login.should eq Time.parse("2012-07-05 18:24:02") }
    end
  end

  describe "#update_account_user" do
    before do
     stub_post("/v2/accountuser/183437").
       with(:query => {:_method => "POST"}).
       to_return(:body => fixture("update_account_user.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.update_account_user(183437, {:email => "jon@gmail.com"})
      a_post("/v2/accountuser/183437").
        with(:query => {:_method => "POST"}).
        should have_been_made
    end    
    describe "AccountUser Object" do
      subject(:account_user){ @client.update_account_user(183437, {:email => "jon@gmail.com"}) }
      it{ account_user.should be_a Surveygizmo::AccountUser }
      it{ account_user.id.should eq 183437 }
      it{ account_user._type.should eq "AccountUser" }
      it{ account_user.username.should eq "Jon" }
      it{ account_user.email.should eq "jon@gmail.com" }
      it{ account_user.status.should eq "Active" }
      it{ account_user.last_login.should eq Time.parse("2012-07-05 18:24:02") }
    end
  end
end