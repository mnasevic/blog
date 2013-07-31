Blog::Application.routes.draw do
  get '/login', :to => 'sessions#new', :as => 'login'
  delete '/logout', :to => 'sessions#destroy', :as => 'logout'
  root :to => 'welcome#index'
  resource :session

  namespace :editor do
    resource :account, :only => [:edit, :update]
    resource :profile, :only => [:edit, :update]
  end
end
