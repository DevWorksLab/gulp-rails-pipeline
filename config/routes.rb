Rails.application.routes.draw do

  root 'public#index'
  get 'about', to: 'public#about', as: :about
  get 'resources', to: 'public#resources', as: :resources
  get 'contact', to: 'public#contact', as: :contact
  resources :people, only: [:index, :show]
  get '/people/mona', to: 'people#mona', as: :mona_path


  namespace :admin do
    root 'dashboard#index'
    resources :people do
      get 'activate', to: 'people#toggle_activation', as: :toggle_activation
    end
  end

  namespace :uxhires do
    root 'jobs#uxhires'
    resources :jobs do
      get 'apply', to: 'jobs#job_app', as: :apply
    end

  end

end
