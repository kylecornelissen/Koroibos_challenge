Rails.application.routes.draw do
  get 'welcome/index'

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index, :show]
      resources :events, only: [:index, :show]
    end
  end
end
