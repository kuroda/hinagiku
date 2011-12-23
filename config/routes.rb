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
  resource :session, :only => [ :new, :create, :destroy ]
  resource :account do
    get :thanks
    resource :initial_email, :only => [ :edit, :update ] do
      get :updated
    end
    resource :password, :only => [ :edit, :update ] do
      get :updated
    end
  end
  get 'v/:id/:token' => 'accounts#verify',
    :id => /\d+/, :token => /[0-9a-f]+/,
    :as => :email_verification
 
  match '*anything' => 'errors#not_found'
end