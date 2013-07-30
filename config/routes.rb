Blog::Application.routes.draw do
  get '/login', :to => 'sessions#new', :as => 'login'
  delete '/logout', :to => 'sessions#destroy', :as => 'logout'
  root :to => 'welcome#index'
  resource :session
end
