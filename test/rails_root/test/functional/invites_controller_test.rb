require File.dirname(__FILE__) + '/../test_helper'

class Muck::InvitesControllerTest < ActionController::TestCase

  tests Muck::InvitesController

  context "invites controller" do

    context "not logged in" do
      context "GET new" do
        setup do
          get :new
        end
        should_redirect_to("the login page") { login_path }
      end
    end

    context "logged in" do
      setup do
        @user = Factory(:user)
        activate_authlogic
        login_as @user
      end

      context "GET new" do
        setup do
          get :new
        end
        should_not_set_the_flash
        should_respond_with :success
        should_render_template :new
      end
    
      context "POST get_contacts (json)" do
        setup do
          post :get_contacts, :get_contacts => {:email => 'muck.invites@yahoo.com', :password => '3trickypass'}, :format => 'json'
        end
        should_not_set_the_flash
        should_respond_with :success
        should "return valid get_contacts json" do
          json = ActiveSupport::JSON.decode(@response.body).symbolize_keys!
          assert json[:success]
          assert json[:contacts].include?(["Folksemantic, Support", "support@folksemantic.com"])
        end
      end

      context "POST get_contacts (html)" do
        setup do
          post :get_contacts, :get_contacts => {:email => 'muck.invites@yahoo.com', :password => '3trickypass'}, :format => 'html'
        end
        should_not_set_the_flash
        should_respond_with :success
        should_render_template :get_contacts
      end

      context "POST to create" do
        context "array of emails" do
          should "create a invite s" do
            assert_difference "Invite.count", 2 do
              post :create,  :emails => [[Factory.next(:email),Factory.next(:email)]]
            end
          end
          should "create a invitee" do
            assert_difference "Invite.count", 2 do
              post :create,  :emails => [[Factory.next(:email),Factory.next(:email)]]
            end
          end
        end
        context "empty emails" do
          context "html" do
            setup do
              post :create,  :emails => ""
            end
            should "set message" do
              assert_equal I18n.translate('muck.invites.emails_empty'), assigns(:message)
            end
          end
          context "js" do
            setup do
              post :create,  :emails => "", :format => 'js'
            end
            should_respond_with :success
            should "set message" do
              assert_equal I18n.translate('muck.invites.emails_empty'), assigns(:message)
            end
          end
          context "pjs" do
            setup do
              post :create,  :emails => "", :format => 'pjs'
            end
            should_respond_with :success
            should "set message" do
              assert_equal I18n.translate('muck.invites.emails_empty'), assigns(:message)
            end
          end
        end
        context "string of emails" do
          should "create a invite s" do
            assert_difference "Invite.count", 2 do
              post :create,  :emails => "#{Factory.next(:email)},#{Factory.next(:email)}"
            end
          end
          should "create a invitee" do
            assert_difference "Invite.count", 2 do
              post :create,  :emails => "#{Factory.next(:email)},#{Factory.next(:email)}"
            end
          end
        end
      end
      
    end
    
  end
  
end
