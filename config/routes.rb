Rails.application.routes.draw do
  root to: 'lists#index'
  get "/archived", to: "lists#archived", as: "archived"
  resources :lists do
    resources :tasks
  end
  post 'tasks/:id/delete_pic' => 'tasks#delete_pic', as: :delete_pic

end
