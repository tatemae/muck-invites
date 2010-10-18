# Rails.application.routes.draw do
#   map.resources :invites, :controller => 'muck/invites', :collection => { :get_contacts => :post }, :new => { :new => [:get, :post], :compose => [:get, :post] }
# end
Rails.application.routes.draw do
  resources :invites, :controller => 'muck/invites' do
    collection do
      post :get_contacts
      get :compose
      post :compose
      get :new
      post :new
    end
  end
end