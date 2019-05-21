Rails.application.routes.draw do
  devise_for :admins
  namespace :backend do

    get 'pop_map/index'
    match 'pop_map/edit/:id', to: 'pop_map#edit', as: 'pop_map_edit', via: [:get, :post]

    get 'account/index'
    get 'account/buy'
    get 'account/show/:id', to: 'account#show', as: 'account_show'
    post 'account/buy'

  end

  root to: 'backend/account#index'
  devise_for :resellers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
