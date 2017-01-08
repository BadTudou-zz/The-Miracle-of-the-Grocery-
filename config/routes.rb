Rails.application.routes.draw do
  get 'sessions/new'

  resources :letters  
  resources :notices
  resources :guests do
  	resources :letters
  end

  get 'home/index'

  get 'welcome/index'

  get 'signup'    => 'guests#new'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
