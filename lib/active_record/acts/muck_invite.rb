module ActiveRecord
  module Acts #:nodoc:
    module MuckInvite #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def acts_as_muck_invite(options = {})

          has_many :user_invites
          has_many :users, :through => :user_invites
          validates_presence_of :email

          named_scope :by_newest, :order => "created_at DESC"
          named_scope :by_oldest, :order => "created_at ASC"
          named_scope :recent, lambda { { :conditions => ['created_at > ?', 1.week.ago] } }

          email_name_regex  = '[\w\.%\+\-]+'.freeze
          domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
          domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
          email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

          validates_format_of :email, :with => email_regex, :message => 'does not look like a valid email address.'

          include ActiveRecord::Acts::MuckInvite::InstanceMethods
          extend ActiveRecord::Acts::MuckInvite::SingletonMethods
          
        end
      end

      # class methods
      module SingletonMethods

        def who_invited?(email, id = nil)
          users = []

          if !id.nil?
            invite = Invite.find(id)
            users |= invite.users if !invite.nil?
          end

          invite = Invite.find_by_email(email)
          users |= invite.users if !invite.nil?

          users
        end
      end
      
      # All the methods available to a record that has had <tt>acts_as_muck_invite</tt> specified.
      module InstanceMethods

      end
    end
  end
end
