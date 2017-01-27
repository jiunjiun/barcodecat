Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins
  namespace :admin, path: '/', constraints: {subdomain: "admin"} do
    root 'dashboard#index'

    resources :events do
      resource :products do
        collection do
          put :update_index
        end
      end
    end
  end

  root 'home#index'

  get 'e/:link_name', to: 'events#show'
end
