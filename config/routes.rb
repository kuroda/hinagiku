Hinagiku::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    put :finish, :restart, :on => :member
    get :done, :search, :on => :collection
  end
  resources :categories do
    resources :tasks, :only => [ :index ] do
      get :done, :on => :collection
    end
  end
end
