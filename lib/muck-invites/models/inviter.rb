module MuckInvites
  module Models #:nodoc:
    module MuckInviter #:nodoc:
      extend ActiveSupport::Concern
      
      included do
        has_many :invites, :as => :inviter
        has_many :invitees, :through => :invites
        scope :by_newest, :order => "created_at DESC"
        scope :by_oldest, :order => "created_at ASC"
        scope :newer_than, lambda { |*args| where("inviters.created_at > ?", args.first || 1.week.ago) }
      end

      module ClassMethods
        def get_contacts(email, password)
          return Contacts::Gmail.new(email, password).contacts if email.include?('@gmail.com')
          return Contacts::Yahoo.new(email, password).contacts if email.include?('@yahoo.com')
          return Contacts::Hotmail.new(email, password).contacts if email.include?('@hotmail.com')
          return Contacts::Aol.new(email, password).contacts if email.include?('@aol.com')
          return Contacts::Plaxo.new(email, password).contacts if email.include?('@plaxo.com')
          return Contacts.guess(email, password).contacts
        end
      end
      
      # Gets all emails have been invited
      def invitee_emails
        invitees.map(&:email)
      end

      # Sends out notification email and adds an activity to each of the inviters activity feeds
      def notify_inviters(invite_id = nil)
        inviters = Invitee.who_invited?(self.email, invite_id)
        if inviters.size > 0
          content = I18n.t('muck.activities.joined_status', :name => self.full_name, :application_name => MuckEngine.configuration.application_name)
          inviters.each do |inviter|
            add_activity(self, self, self, 'status_update', '', content) if MuckInvites.configuration.create_activities_when_invited_joins
            send_invited_joined_emails(inviters) if MuckInvites.configuration.email_inviters_when_invited_joins
          end
        end 
      end

      def send_invited_joined_emails(inviters)
        
      end

      def invite(emails, message, user)
        emails = emails.split(/[, ]/) if !emails.is_a?(Array)
        emails = emails.find_all { |email| !email.blank? }
        emails = emails.flatten.collect { |email| email.strip }

        raise MuckInvites::Exceptions::NoEmails.new(I18n.t('muck.invites.no_email_error')) if emails.blank?
        check_emails = invitee_emails
        emails.each do |email|
          if !check_emails.include?(email)
            check_emails << email
            invitee = Invitee.find_by_email(email) || Invitee.create!(:email => email)
            Invite.create!(:inviter => self, :invitee => invitee, :user => user)
            response = InviteMailer.invite_notification(user, message, email).deliver
          end
        end 
      end
      
      def inviters
        Invite.who_invited?(self.email)
      end
    end
  end
end