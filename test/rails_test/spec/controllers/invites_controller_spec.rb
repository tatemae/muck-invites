require File.dirname(__FILE__) + '/../spec_helper'

describe Muck::InvitesController do

  describe "invites controller" do

    describe "not logged in" do
      describe "GET new" do
        before do
          get :new
        end
        it { should redirect_to( login_path ) }
      end
    end

    describe "logged in" do
      before do
        @user = Factory(:user)
        activate_authlogic
        login_as @user
      end

      describe "GET new" do
        before do
          get :new
        end
        it { should_not set_the_flash }
        it { should respond_with :success }
        it { should render_template :new }
      end
    
      describe "POST get_contacts (json)" do
        before do
          post :get_contacts, :get_contacts => {:email => 'muck.invites@yahoo.com', :password => '3trickypass'}, :format => 'json'
        end
        it { should_not set_the_flash }
        it { should respond_with :success }
        it "should return valid get_contacts json" do
          json = ActiveSupport::JSON.decode(@response.body).symbolize_keys!
          assert json[:success]
          json[:contacts].should include(["Folksemantic, Support", "support@folksemantic.com"])
        end
      end

      describe "POST get_contacts (html)" do
        before do
          post :get_contacts, :get_contacts => {:email => 'muck.invites@yahoo.com', :password => '3trickypass'}, :format => 'html'
        end
        it { should_not set_the_flash }
        it { should respond_with :success }
        it { should render_template :get_contacts }
      end

      describe "POST to create" do
        describe "array of emails" do
          it "should create a invite s" do
            lambda{
              post :create,  :emails => [[Factory.next(:email),Factory.next(:email)]]              
            }.should change(Invite, :count).by(2)
          end
          it "should create a invitee" do
            lambda{
              post :create,  :emails => [[Factory.next(:email),Factory.next(:email)]]              
            }.should change(Invite, :count).by(2)
          end
        end
        describe "empty emails" do
          describe "html" do
            before do
              post :create,  :emails => ""
            end
            it "should set message" do
              assigns(:message).should == I18n.translate('muck.invites.emails_empty')
            end
          end
          describe "js" do
            before do
              post :create,  :emails => "", :format => 'js'
            end
            it { should respond_with :success }
            it "should set message" do
              assigns(:message).should == I18n.translate('muck.invites.emails_empty')
            end
          end
          describe "pjs" do
            before do
              post :create,  :emails => "", :format => 'pjs'
            end
            it { should respond_with :success }
            it "should set message" do
              assigns(:message).should == I18n.translate('muck.invites.emails_empty')
            end
          end
        end
        describe "string of emails" do
          it "should create a invite s" do
            lambda{
              post :create,  :emails => "#{Factory.next(:email)},#{Factory.next(:email)}"              
            }.should change(Invite, :count).by(2)
          end
          it "should create a invitee" do
            lambda{
              post :create,  :emails => "#{Factory.next(:email)},#{Factory.next(:email)}"
            }.should change(Invite, :count).by(2)
          end
        end
      end
      
    end
    
  end
  
end
