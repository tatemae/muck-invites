class ActionController::Routing::RouteSet
  def load_routes_with_muck_invites!
    muck_invites_routes = File.join(File.dirname(__FILE__), *%w[.. .. config muck_invites_routes.rb])
    add_configuration_file(muck_invites_routes) unless configuration_files.include? muck_invites_routes
    load_routes_without_muck_invites!
  end
  alias_method_chain :load_routes!, :muck_invites
end