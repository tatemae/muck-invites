require File.dirname(__FILE__) + '/../test_helper'

# Used to test contacts gem
class ContactsTest < ActiveSupport::TestCase

  context "From the beginning" do
    setup do
      @login = 'muck.invites'
      @password = '3trickypass'
    end
    
    should "be able to retrieve contacts from gmail" do
      assert_operator Contacts::Gmail.new(@login, @password).contacts.size, :>, 0
    end

    should "be able to retrieve contacts from yahoo" do
      assert_operator Contacts::Yahoo.new(@login + '@yahoo.com', @password).contacts.size, :>, 0
    end

    should "be able to retrieve contacts from hotmail" do
      assert_operator Contacts::Hotmail.new(@login + '@hotmail.com', @password).contacts.size, :>, 0
    end

    should "be able to guess the type of account when handed a gmail account" do
      assert_operator Contacts.guess(@login + '@gmail.com', @password).size, :>, 0
    end

    should "be able to guess the type of account when handed a yahoo account" do
      assert_operator Contacts.guess(@login + '@yahoo.com', @password).size, :>, 0
    end

    should "be able to guess the type of account when handed a hotmail account" do
      assert_operator Contacts.guess(@login + '@hotmail.com', @password).size, :>, 0
    end
  end

end