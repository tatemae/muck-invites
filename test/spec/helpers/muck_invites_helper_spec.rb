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
    
    describe "gmail_contacts_for_auto_complete" do
      it "should generate a javascript array" do
        helper.stub!(:gmail_contacts).and_return(@contacts)
        helper.gmail_contacts_for_auto_complete(@user).should_not be_blank
        helper.gmail_contacts_for_auto_complete(@user).should == %q{var gmail_contacts = ['test@example.com (john smith)'];}
      end
    end
    
    describe "gmail_contacts" do
      before do
        xml = File.open(File.expand_path("../../../test/fixtures/google_contacts.xml", __FILE__), "rb").read
        result = mock(:code => '200', :body => xml)
        google = Factory(:authentication)
        @user = google.user
        google.access_token.stub!(:get).and_return(result)
        helper.stub!(:google_oauth_for).and_return(google)        
      end
      it "should parse the returned xml" do
        helper.gmail_contacts(@user)
      end
    end
    
    describe "yahoo_contacts" do
      before do
        xml = File.open(File.expand_path("../../../test/fixtures/yahoo_contacts.xml", __FILE__), "rb").read
        result = mock(:code => '200', :body => xml)
        yahoo = Factory(:authentication)
        @user = yahoo.user
        yahoo.access_token.stub!(:get).and_return(result)
        helper.stub!(:yahoo_oauth_for).and_return(yahoo)        
      end
      it "should parse the returned xml" do
        helper.yahoo_contacts(@user)
      end
    end
    
  end
  
end