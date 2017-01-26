Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins
  namespace :admin, path: '/', constraints: {subdomain: "admin"} do
    root 'dashboard#index'

    resources :events do
      resources :products
    end
  end

  root 'home#index'
end
