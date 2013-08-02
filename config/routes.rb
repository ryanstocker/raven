RavenApp::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: :post

  root to: "messages#index"
  resources :messages
end
