Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end
      post "likes/:tweeet_id/create"=>"likes#create"
      post "likes/:tweeet_id/destroy" => "likes#destroy"
      get 'static_pages/home'
      get 'static_pages/about'
      get 'static_pages/contact'
    devise_for :users, :controllers => {registrations: 'registrations'}
        get '/users/sign_out' => 'devise/sessions#destroy'

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
