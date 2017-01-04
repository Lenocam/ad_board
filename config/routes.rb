Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, path: 'accounts', :controllers => { registrations: 'registrations'}
  resources :users, shallow: true do
    resources :galleries
  end

  #match "*path", :to => "application#routing_error", via: :all

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      as :user do
        post   "/sign-in"  => "sessions#create"
        delete "/sign-out" => "sessions#destroy"

        resources :users, shallow: true do
          resources :galleries
        end
      end
    end
  end
end
