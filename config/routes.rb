# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    mailer: 'users/mailer',
    passwords: 'users/passwords',
    shared: 'users/shared'
  }

  resources :users, path: '', param: :id do
    resources :subgroup
  end

end
