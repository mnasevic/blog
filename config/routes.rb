Blog::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  get '/login', :to => 'sessions#new', :as => 'login'
  delete '/logout', :to => 'sessions#destroy', :as => 'logout'
  root :to => 'welcome#index'
  resource :session
  get '/posts/:id', :to => 'posts#show', :as => 'post'

  namespace :editor do
    resource :account, :only => [:edit, :update]
    resource :profile, :only => [:edit, :update]
    resources :posts
  end
end
