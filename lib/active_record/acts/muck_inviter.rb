module ActiveRecord
  module Acts #:nodoc:
    module MuckInviter #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def acts_as_muck_inviter(options = {})
          has_many :invites, :as => :inviter
          has_many :invitees, :through => :invites
          named_scope :by_newest, :order => "created_at DESC"
          named_scope :by_oldest, :order => "created_at ASC"
          named_scope :recent, lambda { { :conditions => ['created_at > ?', 1.week.ago] } }
                            
          include ActiveRecord::Acts::MuckInviter::InstanceMethods
          extend ActiveRecord::Acts::MuckInviter::SingletonMethods
          
        end
      end

      # class methods
      module SingletonMethods
        def get_contacts(email, password)
          return Contacts::Gmail.new(email, password).contacts if email.include?('@gmail.com')
          return Contacts::Yahoo.new(email, password).contacts if email.include?('@yahoo.com')
          return Contacts::Hotmail.new(email, password).contacts if email.include?('@hotmail.com')
        end
      end
      
      # All the methods available to a record that has had <tt>acts_as_muck_inviter</tt> specified.
      module InstanceMethods

        # Gets all emails have been invited
        def invitee_emails
          invitees.map(&:email)
        end

        # Sends out notification email and adds an activity to each of the inviters activity feeds
        def notify_inviters(invite_id = nil)
          inviters = Invitee.who_invited?(self.email, invite_id)
          if inviters.size > 0
            content = I18n.t('muck.activities.joined_status', :name => self.full_name, :application_name => GlobalConfig.application_name)
            inviters.each do |inviter|
              add_activity(self, self, self, 'status_update', '', content) if GlobalConfig.create_activities_when_invited_joins
              send_invited_joined_emails(inviters) if GlobalConfig.email_inviters_when_invited_joins
            end
          end 
        end

        def send_invited_joined_emails(inviters)
          
        end

        def inviters
          Invite.who_invited?(self.email)
        end
      end
    end
  end
end
