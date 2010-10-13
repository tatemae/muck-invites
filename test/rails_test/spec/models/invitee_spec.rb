require File.dirname(__FILE__) + '/../spec_helper'

describe Invitee do
  
  describe "Invitee" do
    before do
      @user = Factory(:user)
      @invitee = Factory(:invitee)
      @invite = Invite.create(:inviter => @user, :invitee => @invitee, :user => @user)
      @user.reload
    end

    
    it { should validate_presence_of :email }
    it { should have_many :users }

    should_allow_values_for :email, 'a@x.com', 'de.veloper@example.com'
    should_not_allow_values_for :email, 'example.com', '@example.com', 'developer@example', 'developer', :message => 'does not look like a valid email address.'

    it "should require email" do
      lambda{
        u = Factory.build(:invitee, :email => nil)
        u.should_not be_valid
        u.errors[:email].should_not be_empty
      }.should change(Invite, :count)
    end

    it "should not create new invites when more than one person invites the same email address" do
      lambda{
        u = Factory(:user)
        u.invites << @invite
        u.save!.should be_true        
      }.should_not change(Invite, :count)
    end

    it "should be able to see how many inviters it has" do
      @invitee.users.size.should == 1
    end

  end

  describe "User" do
    before do
      @user = Factory(:user)
    end

    it "should be able to call invite with a single email address" do
      @user.invite(Factory.next(:email), 'test', @user)
      @user.invites.size.should == 1
    end

    it "should be able to call invite with a string specifying a space delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ' ' + Factory.next(:email), 'test', @user)
      @user.invites.size.should == 2
    end

    it "should be able to call invite with a string specifying a comma delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ',  ' + Factory.next(:email) + ',' + Factory.next(:email) + ',', 'test', @user)
      @user.invites.size.should == 3
    end

    it "should be able to call invite with an array of email addresses" do
      @user.invite([Factory.next(:email),Factory.next(:email)], 'test', @user)
      @user.invites.size.should == 2
    end

    it "should be able to look up who invited them by email" do
      inviter = Factory(:user)
      invitee = Factory.build(:invitee, :email => @user.email)
      inviter.invites << Invite.create!(:inviter => inviter, :user => inviter, :invitee => invitee)
      inviter.should == Invitee.who_invited?(@user.email).first
    end

    it "should be able to look up who invited them by id" do
      invite = Factory.build(:invitee, :email => @user.email)

      inviter = Factory(:user)
      invitee = Factory.build(:invitee, :email => @user.email)
      inviter.invites << Invite.create!(:inviter => inviter, :user => inviter, :invitee => invitee) 
      inviter.should == Invitee.who_invited?(@user.email).first
    end

    it "should look up multiple inviters by email" do
      invitee = Factory.build(:invitee, :email => @user.email)

      inviter1 = Factory(:user)
      inviter1.invites << Invite.create!(:inviter => inviter1, :user => inviter1, :invitee => invitee)

      inviter2 = Factory(:user)
      inviter2.invites << Invite.create!(:inviter => inviter2, :user => inviter2, :invitee => invitee)

      inviters = Invitee.who_invited?(@user.email)
      inviters.count.should == 2
      inviters.should include(inviter1)
      inviters.should include(inviter2)
    end

    it "should not create new user invites if the user has invited them before" do
      user = Factory(:user)
      email = Factory.next(:email)
      lambda{
        user.invite(email, 'test', user)        
      }.should change(Invite, :count)
      user.reload # if you don't reload the invite just created won't show up.
      lambda{
        user.invite(email, 'test', user)
      }.should_not change(Invite, :count)
    end
  end

  describe "Always" do
    it "should be able to look up who invited them by id and by email" do
      user1 = Factory(:user)
      invitee1 = Factory(:invitee)
      user1.invites << Invite.create!(:inviter => user1, :user => user1, :invitee => invitee1)

      user2 = Factory(:user)
      invitee2 = Factory(:invitee)
      user2.invites << Invite.create!(:inviter => user2, :user => user2, :invitee => invitee2)

      inviters = Invitee.who_invited?(invitee1.email, invitee2.id)
      inviters.size.should == 2
      inviters.should include(user1)
      inviters.should include(user2)
    end

    it "should notify inviters when a new user joins" do
      user1 = Factory(:user)
      invitee1 = Factory(:invitee)
      user1.invites << Invite.create!(:inviter => user1, :user => user1, :invitee => invitee1)

      user2 = Factory(:user)
      invitee2 = Factory(:invitee)
      user2.invites << Invite.create!(:inviter => user2, :user => user2, :invitee => invitee2)

      user3 = Factory.build(:user, :email => invitee1.email)

      lambda{
        user3.notify_inviters(invitee2.id)
      }.should_not raise_error

    end
  end

end