Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surveys, only: [:index, :new, :create, :show, :destroy] do
    resources :questions, only: :create
    member do
      get 'results', to: 'surveys#results'
    end
  end

  resources :questions do
    resources :answers, only: :create
  end

  resources :survey_sessions, only: [:new, :create] do
    member do
      get 'answer', to: 'survey_responses#answer'
    end
  end

  resources :answers, only: :destroy

end
