Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:new,:create,:edit,:update,:show]

  resources :destinations, only: [:show]

  resources :bloggers, only: [:new,:create,:show, :index]

  post 'posts/:id/like' => 'posts#like', as: :like
end
