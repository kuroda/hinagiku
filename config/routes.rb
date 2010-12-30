Nameko::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    put :finish, :on => :member
  end
end
