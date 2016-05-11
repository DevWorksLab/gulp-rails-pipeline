Rails.application.routes.draw do

  root 'public#index'
  get 'work', to: 'public#work', as: :work
  get 'about', to: 'public#about', as: :about
  get 'resources', to: 'public#resources', as: :resources
  get 'contact', to: 'public#contact', as: :contact
  get '/people/mona', to: 'people#mona', as: :mona
  resources :people, only: [:index, :show]


  namespace :admin do
    root 'dashboard#index'
    resources :people do
      get 'activate', to: 'people#toggle_activation', as: :toggle_activation
    end
  end

  namespace :uxhires do
    root 'jobs#uxhires'
    get '/refine', to: 'jobs#refine', as: :refine
    resources :jobs do
      get 'apply', to: 'jobs#job_app', as: :apply
      post 'apply', to: 'jobs#apply', as: :submit_app
    end

  end

end
