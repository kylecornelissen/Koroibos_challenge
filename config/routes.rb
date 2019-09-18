Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      resources :events, only: [:index]
      resources :olympian_stats, only: [:index]

      get '/events/:id/medalists', to: 'events#show'
    end
  end
end
