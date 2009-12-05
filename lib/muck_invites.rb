require 'muck_invites/exceptions'

ActiveRecord::Base.class_eval { include ActiveRecord::Acts::MuckInvitee }
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::MuckInvite }
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::MuckInviter }
I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]
