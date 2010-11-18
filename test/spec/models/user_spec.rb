require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  describe "A class that is inviteable" do
    before do
      @user = Factory(:user)
      @invitee = Factory(:invitee)      
      Invite.create!(:inviter => @user, :invitee => @invitee, :user => @user)
      @user.reload
    end
    
    it "should have invites" do
      @user.invites.length.should == 1
    end
   end 

end