Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users

get    'users', to: 'users#index', as: "users"
get    'users/:id', to: 'users#show', as:"user"
post   'users', to: 'users#create'
patch  'users/:id', to: 'users#update'
put    'users/:id', to: 'users#update'
delete 'users/:id', to: 'users#destroy'
get    'users/new', to: 'users#new', as: 'new_user'
get    'users/:id/edit', to: 'users#edit', as: 'edit_user'

# AKA how it looks in console when calling resources :users
# Prefix Verb   URI Pattern               Controller#Action
#  users GET    /users(.:format)          users#index
#   user GET    /users/:id(.:format)      users#show
#        POST   /users(.:format)          users#create
#        PATCH  /users/:id(.:format)      users#update
#        PUT    /users/:id(.:format)      users#update
#        DELETE /users/:id(.:format)      users#destroy
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit

end
