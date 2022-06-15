# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /ru|en/ do
    root to: 'home#index'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      mailer: 'users/mailer',
      passwords: 'users/passwords',
      shared: 'users/shared'
    }

    get 'home/show', as: 'user_root'
  end
end
