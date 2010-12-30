Nameko::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    put :finish, :unfinish, :on => :member
    get :done, :on => :collection
  end
end
