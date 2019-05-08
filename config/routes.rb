Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers:{ registrations:'user_registrations/registrations'}
  resources :template_ones


  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
