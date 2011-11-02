Hinagiku::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    put :finish, :restart, :on => :member
    get :done, :search, :on => :collection
  end
  resources :categories, :except => [ :show ] do
    resources :tasks, :only => [ :index ] do
      get :done, :on => :collection
    end
  end
  
  match '*anything' => 'errors#not_found'
end