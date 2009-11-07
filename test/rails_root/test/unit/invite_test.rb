require File.dirname(__FILE__) + '/../test_helper'

class InviteTest < ActiveSupport::TestCase
  
  context "Invite" do
    setup do
      @user = Factory(:user)
      @invite = Factory(:invite)
      @user.invites << @invite
    end

    subject { @invite }
    should_validate_presence_of :email
    should_have_many :users

    should_allow_values_for :email, 'a@x.com', 'de.veloper@example.com'
    should_not_allow_values_for :email, 'example.com', '@example.com', 'developer@example', 'developer', :message => 'does not look like a valid email address.'

    should "require email" do
      assert_no_difference 'Invite.count' do
        u = Factory.build(:invite, :email => nil)
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
      assert_equal 1, @invite.users.size
    end

  end

  context "User" do
    setup do
      @user = Factory(:user)
    end

    subject { @user }

    should "be able to call invite with a single email address" do
      @user.invite(Factory.next(:email))
      assert_equal 1, @user.invites.size
    end

    should "be able to call invite with a string specifying a space delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ' ' + Factory.next(:email))
      assert_equal 2, @user.invites.size
    end

    should "be able to call invite with a string specifying a comma delimited list of email addresses" do
      @user.invite(Factory.next(:email) + ',  ' + Factory.next(:email) + ',' + Factory.next(:email) + ',')
      assert_equal 3, @user.invites.size
    end

    should "be able to call invite with an array of email addresses" do
      @user.invite([Factory.next(:email),Factory.next(:email)])
      assert_equal 2, @user.invites.size
    end

    should "be able to look up who invited them by email" do
      inviter = Factory(:user)
      inviter.invites << Factory.build(:invite, :email => @user.email)
      assert_equal Invite.who_invited?(@user.email).first, inviter
    end

    should "be able to look up who invited them by id" do
      invite = Factory.build(:invite, :email => @user.email)

      inviter = Factory(:user)
      inviter.invites << Factory.build(:invite, :email => @user.email)
      assert_equal Invite.who_invited?(@user.email).first, inviter
    end

    should "look up multiple inviters by email" do
      invite = Factory.build(:invite, :email => @user.email)

      inviter1 = Factory(:user)
      inviter1.invites << invite

      inviter2 = Factory(:user)
      inviter2.invites << invite

      inviters = Invite.who_invited?(@user.email)
      assert_equal 2, inviters.count
      assert inviters.include?(inviter1)
      assert inviters.include?(inviter2)
    end

    should "not create new user invites if the user has invited them before" do
      user = Factory(:user)
      email = Factory.next(:email)
      user.invite(email)
      user.invite(email)
      assert_equal 1, Invite.all.size
      assert_equal 1, user.invites.size
    end
  end

  context "Always" do
    should "be able to look up who invited them by id and by email" do
      user1 = Factory(:user)
      invite1 = Factory(:invite)
      user1.invites << invite1

      user2 = Factory(:user)
      invite2 = Factory(:invite)
      user2.invites << invite2

      inviters = Invite.who_invited?(invite1.email, invite2.id)
      assert_equal 2, inviters.size
      assert inviters.include?(user1)
      assert inviters.include?(user2)
    end

    should "notify inviters when a new user joins" do
      user1 = Factory(:user)
      invite1 = Factory(:invite)
      user1.invites << invite1

      user2 = Factory(:user)
      invite2 = Factory(:invite)
      user2.invites << invite2

      user3 = Factory.build(:user, :email => invite1.email)

      assert_nothing_raised do
        user3.notify_inviters(invite2.id)
      end 
    end
  end

end