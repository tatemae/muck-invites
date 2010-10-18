module MuckInvites
  module Models #:nodoc:
    module MuckInvite #:nodoc:
      extend ActiveSupport::Concern
      
      included do
        belongs_to :invitee
        belongs_to :inviter, :polymorphic => true
        # User and inviter might be the same.  For example, if a user invites their friends then user == inviter.  
        # However if inviter is something else for example an Event then having a user field let's us quickly
        # discover who created the invite.  (Used by who_invited?)
        belongs_to :user
        
        scope :by_newest, :order => "created_at DESC"
        scope :by_oldest, :order => "created_at ASC"
        scope :newer_than, lambda { |*args| where("invites.created_at > ?", args.first || 1.week.ago) }
      end

    end
  end
end
