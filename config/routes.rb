Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles

  # To show the root request is welcome_controller and action is index
  root 'welcome#index'

  post 'articles/new'
end
