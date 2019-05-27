Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surveys, only: [:index, :new, :create, :show] do
    resources :questions, only: :create
  end

  resources :questions do
    resources :answers, only: :create
  end

  resources :survey_sessions, only: [:new, :create] do
    member do
      get 'answer', to: 'survey_responses#answer'
    end
  end
end
