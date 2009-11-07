ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'default', :action => 'index'
  map.resources :users, :controller => 'muck/users' do |users|
    users.resources :invites, :controller => 'muck/invites'
  end
end