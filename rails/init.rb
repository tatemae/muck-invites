ActiveSupport::Dependencies.load_once_paths << lib_path # disable reloading of this plugin

require 'muck_invites'
require 'muck_invites/initialize_routes'

if config.respond_to?(:gems)
  config.gem "contacts"
else
  begin
    require 'contacts'
  rescue LoadError
    begin
      gem 'contacts'
    rescue Gem::LoadError
      puts "Please install the contacts gem"
    end
  end
end