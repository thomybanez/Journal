Rails.application.routes.draw do

  #Categories  
  get '/categories', to: 'categories#index', as: 'categories_index'

  #New Create Pair
  get '/categories/new', to: 'categories#new', as: 'categories_new'
  post '/categories/create', to: 'categories#create', as: 'categories_create'

  #Edit Update Pair
  get '/categories/:category_id/edit', to: 'categories#edit', as: 'categories_edit'
  patch '/categories/:category_id', to: 'categories#update', as: 'categories_update'

  #Delete
  delete '/categories/:category_id/delete', to: 'categories#delete', as: 'categories_delete'


  #Task
  get '/categories/:category_id/tasks', to: 'task#index', as: 'categories_tasks_index'

  get '/categories/:category_id/tasks/new', to: 'task#new', as: 'categories_tasks_new'
  post '/categories/:category_id/tasks/create', to: 'task#create', as: 'categories_tasks_create'
  
  get '/categories/:category_id/tasks/:id/edit', to: 'task#edit', as: 'categories_tasks_edit'
  patch '/categories/:category_id/tasks/:id', to: 'task#update', as: 'categories_tasks_update'

  delete '/categories/:category_id/tasks/:id/delete', to: 'task#delete', as: 'categories_tasks_delete'


  #Sessions
  get '/login', to: 'sessions#login', as: 'sessions_login'
  post 'login/create', to: 'sessions#login_create', as: 'sessions_login_create'
  get '/signup', to: 'sessions#signup', as: 'sessions_signup'
  post '/signup/create', to: 'sessions#signup_create', as: 'sessions_signup_create'
  get '/logout', to: 'sessions#logout', as: 'logout'
end
