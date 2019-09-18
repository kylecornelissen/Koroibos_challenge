Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index, :show]
      resources :events, only: [:index, :show]

      get '/olympian_stats', to: 'olympian_stats#show'
    end
  end
end
