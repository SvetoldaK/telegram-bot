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

  resources :users do
    resources :chat do 
      resources :group
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
