Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, controllers: {
   sessions: 'user/sessions',
   registrations: 'user/registrations'
 }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  root "pages#home"
end
