ActionController::Routing::Routes.draw do |map|
  map.resources :invites, :controller => 'muck/invites', :collection => { :get_contacts => :post }
end
