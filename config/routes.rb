Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
   resources :issues do
    resources :answers
   end 
  devise_for :users
  root to: "home#index"
end
