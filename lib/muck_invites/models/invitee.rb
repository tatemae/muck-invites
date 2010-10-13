module MuckInvites
  module Models #:nodoc:
    module MuckInvitee #:nodoc:
      extend ActiveSupport::Concern
      
      included do
        has_many :invites
        has_many :users, :through => :invites
        validates_presence_of :email
                                
        scope :by_newest, :order => "created_at DESC"
        scope :by_oldest, :order => "created_at ASC"
        scope :newer_than, lambda { |*args| where("invitees.created_at > ?", args.first || 1.week.ago) }

        email_name_regex  = '[\w\.%\+\-]+'.freeze
        domain_head_regex = '(?:[A-Z0-9\-]+\.)+'.freeze
        domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
        email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

        validates_format_of :email, :with => email_regex, :message => I18n.translate('muck.invites.invalid_email_error')
      end

      module ClassMethods

        def who_invited?(email, invitee_id = nil)
          users = []

          if !invitee_id.nil?
            invite = self.find(invitee_id)
            users |= invite.users if !invite.nil?
          end

          invite = self.find_by_email(email)
          users |= invite.users if !invite.nil?

          users
        end
      end
      
    end
  end
end
