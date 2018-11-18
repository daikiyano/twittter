Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  get '/users/sign_out' => 'devise/sessions#destroy'
    root "tweeets#index"
    resources :users  do
      member do
        get :following, :followers
      end
    end
  resources :tweeets do
    resources :comments
  end
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
