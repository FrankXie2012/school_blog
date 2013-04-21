SchoolBlog::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users do
    member do
      get :user_info
      put :set_role
      post :set_role
    end
    collection do
      get :crop
      get :manage_posts
      get :manage_comments
    end
  end

  resources :posts do
    resources :comments do
      member do
        post :modify
        post :edit
        put  :edit
      end
    end
  end

  resources :admins

  match 'admins' => 'admins#index'

  root :to => "users#all_posts"
end
