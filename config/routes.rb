Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  resources :bloggers, only: [:index, :show]
  resources :destinations, only: [:index, :show]
  post 'posts/:id/like', to: 'posts#like'

end
