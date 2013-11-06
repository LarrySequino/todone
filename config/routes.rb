Todone::Application.routes.draw do
  root to: 'lists#index'
  resources :items
  resources :lists
  resources :users
end
