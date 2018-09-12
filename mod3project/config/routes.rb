Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :questions, only: [:index, :show, :create, :update]
      resources :answers, only: [:index, :create, :update]
    end
  end
end
