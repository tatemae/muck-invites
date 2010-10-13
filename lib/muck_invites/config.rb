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

    
    def initialize
      self.use_gravatar_in_photo_list = true     # The invite list can include photos from gravatar if this is true
    end
    
  end
end