Rails.application.routes.draw do
  get 'letters/show'

  get 'letters/new'

  get 'home/index'

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
