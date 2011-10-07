Layla::Application.routes.draw do
  
  root :to => 'search#index'
  match '/viagens' => 'search#search'
  
  devise_for :admins
  devise_for :advertisers
  
end
