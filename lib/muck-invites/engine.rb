require 'muck_invites'
require 'rails'

module MuckActivities
  class Engine < ::Rails::Engine
    
    def muck_name
      'muck-invites'
    end
    
    initializer 'muck_invites.helpers' do
      ActiveSupport.on_load(:action_view) do
        include MuckInvitesHelper
      end
    end
    
  end
end