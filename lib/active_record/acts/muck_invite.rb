module ActiveRecord
  module Acts #:nodoc:
    module MuckInvite #:nodoc:
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def acts_as_muck_invite(options = {})
          belongs_to :invitee
          belongs_to :inviter, :polymorphic => true
          # User and inviter might be the same.  For example, if a user invites their friends then user == inviter.  
          # However if inviter is something else for example an Event then having a user field let's us quickly
          # discover who created the invite.  (Used by who_invited?)
          belongs_to :user
          
          named_scope :by_newest, :order => "created_at DESC"
          named_scope :by_oldest, :order => "created_at ASC"
          named_scope :recent, lambda { { :conditions => ['created_at > ?', 1.week.ago] } }

          include ActiveRecord::Acts::MuckInvite::InstanceMethods
          extend ActiveRecord::Acts::MuckInvite::SingletonMethods
          
        end
      end

      # class methods
      module SingletonMethods
      end
      
      # All the methods available to a record that has had <tt>acts_as_muck_invite</tt> specified.
      module InstanceMethods
      end
    end
  end
end
