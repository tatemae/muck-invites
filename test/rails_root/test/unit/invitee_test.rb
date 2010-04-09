require File.dirname(__FILE__) + '/../test_helper'

class InviteeTest < ActiveSupport::TestCase
  
  context "Invitee" do
    setup do
      @user = Factory(:user)
      @invitee = Factory(:invitee)
      @invite = Invite.create(:inviter => @user, :invitee => @invitee, :user => @user)
      @user.reload
    end

    subject { @invitee }
    should_validate_presence_of :email
    should_have_many :users

    should_allow_values_for :email, 'a@x.com', 'de.veloper@example.com'
    should_not_allow_values_for :email, 'example.com', '@example.com', 'developer@example', 'developer', :message => 'does not look like a valid email address.'

    should "require email" do
      assert_no_difference 'Invite.count' do
        u = Factory.build(:invitee, :email => nil)
        assert !u.valid?
        assert u.errors.on(:email)
      end
    end

    should "not create new invites when more than one person invites the same email address" do
      assert_no_difference 'Invite.count' do
        u = Factory(:user)
        u.invites << @invite
        u.save!
      end
    end

    should "be able to see how many inviters it has" do
      assert_equal 1, @invitee.users.size
    end

  end

  context "User" do
    setup do
      @user = Factory(:user)
    end

    subject { @user }

    should "be able to call invite with a single email address" do
      @user.invite(Factory.next(:email), 'test', @user)
      assert_equal 1, @user.invites.size
    end

    should "be able to call invite with a string specifying a space delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ' ' + Factory.next(:email), 'test', @user)
      assert_equal 2, @user.invites.size
    end

    should "be able to call invite with a string specifying a comma delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ',  ' + Factory.next(:email) + ',' + Factory.next(:email) + ',', 'test', @user)
      assert_equal 3, @user.invites.size
    end

    should "be able to call invite with an array of email addresses" do
      @user.invite([Factory.next(:email),Factory.next(:email)], 'test', @user)
      assert_equal 2, @user.invites.size
    end

    should "be able to look up who invited them by email" do
      inviter = Factory(:user)
      invitee = Factory.build(:invitee, :email => @user.email)
      inviter.invites << Invite.create!(:inviter => inviter, :user => inviter, :invitee => invitee)
      assert_equal Invitee.who_invited?(@user.email).first, inviter
    end

    should "be able to look up who invited them by id" do
      invite = Factory.build(:invitee, :email => @user.email)

      inviter = Factory(:user)
      invitee = Factory.build(:invitee, :email => @user.email)
      inviter.invites << Invite.create!(:inviter => inviter, :user => inviter, :invitee => invitee) 
      assert_equal Invitee.who_invited?(@user.email).first, inviter
    end

    should "look up multiple inviters by email" do
      invitee = Factory.build(:invitee, :email => @user.email)

      inviter1 = Factory(:user)
      inviter1.invites << Invite.create!(:inviter => inviter1, :user => inviter1, :invitee => invitee)

      inviter2 = Factory(:user)
      inviter2.invites << Invite.create!(:inviter => inviter2, :user => inviter2, :invitee => invitee)

      inviters = Invitee.who_invited?(@user.email)
      assert_equal 2, inviters.count
      assert inviters.include?(inviter1)
      assert inviters.include?(inviter2)
    end

    should "not create new user invites if the user has invited them before" do
      user = Factory(:user)
      email = Factory.next(:email)
      assert_difference "Invite.count" do
        user.invite(email, 'test', user)
      end
      user.reload # if you don't reload the invite just created won't show up.
      assert_no_difference "Invite.count" do
        user.invite(email, 'test', user)
      end
    end
  end

  context "Always" do
    should "be able to look up who invited them by id and by email" do
      user1 = Factory(:user)
      invitee1 = Factory(:invitee)
      user1.invites << Invite.create!(:inviter => user1, :user => user1, :invitee => invitee1)

      user2 = Factory(:user)
      invitee2 = Factory(:invitee)
      user2.invites << Invite.create!(:inviter => user2, :user => user2, :invitee => invitee2)

      inviters = Invitee.who_invited?(invitee1.email, invitee2.id)
      assert_equal 2, inviters.size
      assert inviters.include?(user1)
      assert inviters.include?(user2)
    end

    should "notify inviters when a new user joins" do
      user1 = Factory(:user)
      invitee1 = Factory(:invitee)
      user1.invites << Invite.create!(:inviter => user1, :user => user1, :invitee => invitee1)

      user2 = Factory(:user)
      invitee2 = Factory(:invitee)
      user2.invites << Invite.create!(:inviter => user2, :user => user2, :invitee => invitee2)

      user3 = Factory.build(:user, :email => invitee1.email)

      assert_nothing_raised do
        user3.notify_inviters(invitee2.id)
      end 
    end
  end

end