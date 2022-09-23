Rails.application.routes.draw do
  devise_for :users#, controllers: { registrations: 'registrations' }
  
  resources :tasks do
    member do
      get :change_status
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
   root "welcome#index"
end
