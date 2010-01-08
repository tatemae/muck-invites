module ActiveRecord
  module Acts #:nodoc:
    module MuckInvitee #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def acts_as_muck_invitee(options = {})

          has_many :invites
          has_many :users, :through => :invites
          validates_presence_of :email
                                  
          named_scope :by_newest, :order => "created_at DESC"
          named_scope :by_oldest, :order => "created_at ASC"
          named_scope :recent, lambda { { :conditions => ['created_at > ?', 1.week.ago] } }

          email_name_regex  = '[\w\.%\+\-]+'.freeze
          domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
          domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
          email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

          validates_format_of :email, :with => email_regex, :message => I18n.translate('muck.invites.invalid_email_error')

          include ActiveRecord::Acts::MuckInvitee::InstanceMethods
          extend ActiveRecord::Acts::MuckInvitee::SingletonMethods
          
        end
      end

      # class methods
      module SingletonMethods

        def who_invited?(email, invitee_id = nil)
          users = []

          if !invitee_id.nil?
            invite = Invitee.find(invitee_id)
            users |= invite.users if !invite.nil?
          end

          invite = Invitee.find_by_email(email)
          users |= invite.users if !invite.nil?

          users
        end
      end
      
      # All the methods available to a record that has had <tt>acts_as_muck_invitee</tt> specified.
      module InstanceMethods

      end
    end
  end
end
