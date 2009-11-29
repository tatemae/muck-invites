require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  context "A class that is inviteable" do
    setup do
      @user = Factory(:user)
      @invitee = Factory(:invitee)      
      Invite.create!(:inviter => @user, :invitee => @invitee, :user => @user)
      @user.reload
    end
    
    should "have invites" do
      assert_equal 1, @user.invites.length
    end
   end 

end