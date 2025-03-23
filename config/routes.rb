Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #auth
      post '/signup' , to:'users#signup'
      post '/login' , to:'users#login'

      #restful routes
      resources :tasks , except: [:new,:edit]
      resources :categories, only: [:index,:create]
    end
  end

end
