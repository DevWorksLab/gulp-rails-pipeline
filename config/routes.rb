Rails.application.routes.draw do

  root 'public#index'
  get 'work', to: 'public#work', as: :work
  get 'about', to: 'public#about', as: :about
  get 'resources', to: 'public#resources', as: :resources
  get 'contact', to: 'public#contact', as: :contact
  get '/people/mona', to: 'people#mona', as: :mona
  resources :people, only: [:index, :show]

  #case studies
  get '/case-studies/jet', to: 'case_studies#jet', as: :jet
  get '/case-studies/phhhoto', to: 'case_studies#phhhoto', as: :phhhoto
  get '/case-studies/trendsetter', to: 'case_studies#trendsetter', as: :trendsetter

  #white papers
  get '/white-papers/digital-diary', to: 'white_papers#digital_diary', as: :digital_diary
  get '/white-papers/the-ux-strategy-equation', to: 'white_papers#ux_strategy', as: :ux_strategy
  get '/white-papers/journey-maps', to: 'white_papers#journey_maps', as: :journey_maps
  get '/white-papers/retail-ethnography-in-practice', to: 'white_papers#retail_ethnography', as: :retail_ethnography
  get '/white-papers/friendship-groups', to: 'white_papers#friendship_groups', as: :friendship_groups
  get '/white-papers/new-techniques-for-design-research', to: 'white_papers#design_research', as: :design_research


  namespace :admin do
    root 'dashboard#index'
    resources :people do
      get 'activate', to: 'people#toggle_activation', as: :toggle_activation
    end
  end

  namespace :uxhires do
    root 'jobs#uxhires'
    get '/refine', to: 'jobs#refine', as: :refine
    resources :jobs, except: [:show] do
      get 'apply', to: 'jobs#job_app', as: :apply
      post 'apply', to: 'jobs#apply', as: :submit_app
    end

    get '/jobs/:id', to: 'jobs#job_show', as: :job_show

  end


end
