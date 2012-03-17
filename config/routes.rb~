Sap4::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get "static_pages/home"

  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"

  root to: 'static_pages#home'
  match '/home' => 'static_pages#home'
  match '/signin' => 'sessions#new'
  match '/signout' => 'sessions#destroy', via: :delete
  match '/signup' => 'users#new'
  match '/help' => 'static_pages#help'
  match '/about' => 'static_pages#about'
  match '/contact' => 'static_pages#contact'

end
