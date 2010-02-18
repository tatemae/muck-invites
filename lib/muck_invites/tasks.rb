require 'rake'
require 'rake/tasklib'
require 'fileutils'

module MuckInvites
  class Tasks < ::Rake::TaskLib
    def initialize
      define
    end
  
    private
    def define
      
      namespace :muck do
        namespace :sync do
          desc "Sync required files from muck invites."
          task :invites do
            path = File.join(File.dirname(__FILE__), *%w[.. ..])
            system "rsync -ruv #{path}/db ."
            system "rsync -ruv #{path}/public ."
          end
        end
      end

    end
  end
end
MuckInvites::Tasks.new