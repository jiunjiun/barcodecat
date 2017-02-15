Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  namespace :admin, path: '/', constraints: { subdomain: 'admin' } do
    devise_scope :admin do
      get 'passwords/edit', to: 'registrations#edit',   as: 'edit_passwords'
      put 'passwords',      to: 'registrations#update', as: 'passwords'
    end

    root 'dashboard#index'

    resources :events do
      resources :products do
        collection do
          put :update_index
        end
      end
    end
  end

  root 'home#index'

  get 'e/:link_name', to: 'events#show', as: 'event'
end
