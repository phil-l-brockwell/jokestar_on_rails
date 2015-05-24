Rails.application.routes.draw do

  devise_for :users
  
  root 'jokes#index'

  resources :jokes do
    resources :stars
  end
end
