Rails.application.routes.draw do
  root to: 'lists#index'
  get "/archived", to: "lists#archived", as: "archived"
  resources :lists do
    resources :tasks
  end
end
