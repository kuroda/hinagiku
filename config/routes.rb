Hinagiku::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    put :finish, :restart, :on => :member
    get :done, :search, :on => :collection
  end
end
