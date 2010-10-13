require File.dirname(__FILE__) + '/../spec_helper'

describe InviteMailer do

  describe "deliver emails" do

    before(:each) do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
    end
    
    it "should send invite notification email" do
      user = Factory(:user)
      contact_email = Factory.next(:email)
      email = InviteMailer.invite_notification(user, 'test', contact_email).deliver
      ActionMailer::Base.deliveries.should_not be_empty
      #assert_match "#{user.full_name}", response.body, "User's name was not found in the email"
      #assert_match "/#{user.id}", response.body, "A link to the inviter's profile was not found in the email"
      email.subject.should == I18n.t('muck.invites.invite', :inviter => user.full_name, :app_name => MuckEngine.configuration.application_name)
      email.to.should == [contact_email]
      email.from.should == [MuckEngine.configuration.from_email]
    end

    it "should send invited joined notification email" do
      user = Factory(:user)
      inviter = Factory(:user)
      email = InviteMailer.invited_joined_notification(user, inviter).deliver
      ActionMailer::Base.deliveries.should_not be_empty
      #assert_match "#{user.full_name}", response.body, "Inviter's name was not found in the email"
      #assert_match "/#{inviter.id}", response.body, "A link to the new user's profile was not found in the email"
      email.subject.should == I18n.t('muck.invites.invited_joined', :user => inviter.full_name, :app_name => MuckEngine.configuration.application_name)
      email.to.should == [inviter.email]
      email.from.should == [MuckEngine.configuration.from_email]
    end

  end  
end
