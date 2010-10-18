module MuckInvites
  
  def self.configuration
    # In case the user doesn't setup a configure block we can always return default settings:
    @configuration ||= Configuration.new
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :use_gravatar_in_photo_list
    attr_accessor :create_activities_when_invited_joins
    attr_accessor :email_inviters_when_invited_joins
    
    def initialize
      self.use_gravatar_in_photo_list = true     # The invite list can include photos from gravatar if this is true
      self.create_activities_when_invited_joins = true
      self.email_inviters_when_invited_joins = true
    end
    
  end
end