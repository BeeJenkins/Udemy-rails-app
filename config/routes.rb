Rails.application.routes.draw do
  devise_for :users, controllers:{ registrations:'user_registrations/registrations'}
  resources :template_ones


  root to: 'template_ones#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
