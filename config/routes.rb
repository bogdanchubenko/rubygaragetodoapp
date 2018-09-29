Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]

  resources :projects, only: %i[create edit update show destroy index new]

  resources :projects, shallow: true do
    resources :tasks, path: 'project_tasks' do
      member do
        patch :complete
      end
    end
  end
  resources :tasks do
    put :sort, on: :collection
  end

  root to: 'static_pages#home'

  match '/about', to: 'static_pages#about', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
