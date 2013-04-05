SchoolBlog::Application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :user_info
    end
    collection do
      get :manage_posts
      get :manage_comments
    end
  end

  resources :posts do
    resources :comments
  end

  resources :admins

  match 'admins' => 'admins#index'
  match 'set_to_admin' => 'admins#set_to_admin'
  match 'set_to_common_user' => 'admins#set_to_common_user'

  root :to => "users#all_posts"
end
