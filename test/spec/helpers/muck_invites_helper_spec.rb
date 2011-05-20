require File.dirname(__FILE__) + '/../spec_helper'

describe MuckInvitesHelper do
  
  before do
    @user = Factory(:user)
    @contacts = [{:name => 'Bill Smith', :email => 'test@example.com'}]
  end
  
  describe "contact_list" do
    it "should render a list of the contacts with name" do
      helper.contact_list(@contacts).should include('<td class="name">Bill Smith</td>')
    end
    it "should render a list of the contacts with email" do      
      helper.contact_list(@contacts).should include('<td class="email">test@example.com</td>')
    end
  end
  
  describe "invite_ajax_message_container" do
    it "output a a div for messages" do
      helper.invite_ajax_message_container.should include('invite-messages')
    end
  end
  
  describe "invite_ajax_message" do
    it "should output the message" do
      message = 'some great error message'
      helper.invite_ajax_message(message).should include(message)
    end
  end
  
  describe "contact_container" do
    it "should build a partial with a list of contacts" do
      helper.contact_container(@contacts).should include('<div class="contact-chooser">')
    end
  end
  
  describe "user with google oauth" do
    before do
      @authentication = Factory(:authentication, :provider => 'google')
      @user = @authentication.authenticatable
      @contacts = [{:name => 'john smith', :email => 'test@example.com'}]
    end
    
    describe "google_oauth_for" do
      it "should find a google auth entry for the user" do
        helper.google_oauth_for(@user).should == @authentication
      end
    end
    
    describe "contacts_for_auto_complete" do
      it "should generate a javascript array" do
        helper.contacts_for_auto_complete(@contacts).should_not be_blank
        helper.contacts_for_auto_complete(@contacts).should == %q{var auto_complete_contacts = ['test@example.com'];}
      end
    end
    
    describe "gmail_contacts" do
      before do
        xml = File.open(File.expand_path("../../../test/fixtures/google_contacts.xml", __FILE__), "rb").read
        FakeWeb.register_uri(:get, "https://www.google.com/m8/feeds/contacts/default/full?max-results=10000", :body => xml)          
        google = Factory(:authentication)
        @user = google.authenticatable
        helper.stub!(:google_oauth_for).and_return(google)        
      end
      it "should parse the returned xml" do
        helper.gmail_contacts(@user).should_not be_blank
      end
    end
    
    describe "yahoo_contacts" do
      before do
        xml = File.open(File.expand_path("../../../test/fixtures/yahoo_contacts.json", __FILE__), "rb").read
        FakeWeb.register_uri(:get, "http://social.yahooapis.com/v1/user/", :body => xml)  
        yahoo = Factory(:authentication)
        @user = yahoo.authenticatable
        helper.stub!(:yahoo_oauth_for).and_return(yahoo)        
      end
      it "should parse the returned xml" do
        helper.yahoo_contacts(@user)
      end
    end
    
  end
  
end