Rails.application.routes.draw do

  root 'public#index'
  get 'about', to: 'public#about', as: :about
  get 'people', to: 'public#people', as: :people
  get 'resources', to: 'public#resources', as: :resources
  get 'contact', to: 'public#contact', as: :contact
end
