Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  get '/users/sign_out' => 'items#index'
  resources :items do
    resources :lists, only: [:index, :create, :destroy, :edit, :update]
    resources :items, only: [:index, :create, :destroy, :edit, :update]

  end
end
