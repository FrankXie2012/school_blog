SchoolBlog::Application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :user_info
      put :set_role
      post :set_role
    end
    collection do
      get :school_news
      get :manage_posts
      get :manage_comments
    end
  end

  resources :posts do
    collection do
      get :autocomplete_search
    end
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
