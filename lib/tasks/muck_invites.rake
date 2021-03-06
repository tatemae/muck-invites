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