Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  get '/users/sign_out' => 'devise/sessions#destroy'
    root "tweeets#index"
  resources :tweeets do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
