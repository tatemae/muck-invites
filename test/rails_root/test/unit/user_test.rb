require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  context "A class that is inviteable" do
    setup do
      @user = Factory(:user)
      email = Factory.next(:email)
      @invite = @user.invites.build(:email => email)
      @user.save!
    end
    
    should "have invites" do
      assert_equal 1, @user.invites.length
    end
   end 

end