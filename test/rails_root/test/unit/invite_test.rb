require File.dirname(__FILE__) + '/../test_helper'

class InviteTest < ActiveSupport::TestCase
  
  context "Invite" do
    setup do
      @user = Factory(:user)
      @invitee = Factory(:invitee)
      @invite = Invite.create(:inviter => @user, :invitee => @invitee, :user => @user)
    end

    subject { @invite }

    should_belong_to :user
    should_belong_to :inviter
    should_belong_to :invitee
    
  end
end