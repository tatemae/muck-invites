Rails.application.routes.draw do
  map.resources :invites, :controller => 'muck/invites', :collection => { :get_contacts => :post }, :new => { :new => [:get, :post], :compose => [:get, :post] }
end
