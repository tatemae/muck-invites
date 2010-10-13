require File.dirname(__FILE__) + '/../spec_helper'

describe Invite do
  
  describe "Invite" do
    before do
      @user = Factory(:user)
      @invitee = Factory(:invitee)
      @invite = Invite.create(:inviter => @user, :invitee => @invitee, :user => @user)
    end

    

    it { should belong_to :user }
    it { should belong_to :inviter }
    it { should belong_to :invitee }
    
  end
end