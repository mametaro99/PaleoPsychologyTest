Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :tests do
      resources :questions, only: [:new, :create, :edit, :update, :destroy]
    end
    root to: 'tests#index' # 管理者画面のトップ
  end
  resources :tests do
    resources :questions, only: [:new, :create]
  end
  root 'tests#index'
  devise_for :users, controllers: {
   sessions: 'user/sessions',
   passwords: 'user/passwords',
   registrations: 'user/registrations'
 }
end
