require File.dirname(__FILE__) + '/../test_helper'
require 'user_mailer'

class InviteMailerTest < ActiveSupport::TestCase

  context "deliver emails" do

    def setup
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
      @expected = TMail::Mail.new
      @expected.set_content_type "text", "plain", { "charset" => 'utf-8' }
    end

    should "send invite notification email" do
      user = Factory(:user)
      contact_email = Factory.next(:email)
      response = InviteMailer.deliver_invite_notification(user, 'test', contact_email)
      assert !ActionMailer::Base.deliveries.empty?, "No email was sent"
      assert_match "#{user.full_name}", response.body, "User's name was not found in the email"
      assert_match "/#{user.id}", response.body, "A link to the inviter's profile was not found in the email"
      email = ActionMailer::Base.deliveries.last
      assert_equal email.to, [contact_email]
      assert_equal email.from, [GlobalConfig.from_email]
    end

    should "send invited joined notification email" do
      user = Factory(:user)
      inviter = Factory(:user)
      response = InviteMailer.deliver_invited_joined_notification(user, inviter)
      assert !ActionMailer::Base.deliveries.empty?, "No email was sent"
      assert_match "#{user.full_name}", response.body, "Inviter's name was not found in the email"
      assert_match "/#{inviter.id}", response.body, "A link to the new user's profile was not found in the email"
      email = ActionMailer::Base.deliveries.last
      assert_equal email.to, [inviter.email]
      assert_equal email.from, [GlobalConfig.from_email]
    end

  end  
end
