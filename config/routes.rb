Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, path: 'accounts', :controllers => { registrations: 'registrations'}
  resources :users, shallow: true do
    resources :galleries
  end
end
