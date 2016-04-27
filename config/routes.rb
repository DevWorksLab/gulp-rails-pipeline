Rails.application.routes.draw do

  root 'public#index'
  get 'about', to: 'public#about', as: :about
  get 'people', to: 'public#people', as: :people
  get 'resources', to: 'public#resources', as: :resources
  get 'contact', to: 'public#contact', as: :contact
  

  namespace :admin do
    root 'dashboard#index'
    resources :people do
      get 'activate', to: 'people#toggle_activation', as: :toggle_activation
    end
  end

  namespace :uxhires do
    root 'jobs#uxhires'
    resources :jobs
  end

end
