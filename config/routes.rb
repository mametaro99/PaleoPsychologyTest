Rails.application.routes.draw do
  devise_for :admins
  resources :tests do
    resources :questions, only: [:new, :create]
  end
  root 'tests#index'
  devise_for :users, controllers: {
   sessions: 'user/sessions',
   registrations: 'user/registrations'
 }
end
