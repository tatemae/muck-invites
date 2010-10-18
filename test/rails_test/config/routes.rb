RailsTest::Application.routes.draw do
  root :to => 'default#index'
  resources :users, :controller => 'muck/users' do
    resources :invites, :controller => 'muck/invites'
  end
end