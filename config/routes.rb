SchoolBlog::Application.routes.draw do
  devise_for :users
  resources :users

  resources :posts do
    resources :comments
  end

  match 'admins' => 'admins#index'
  root :to => "users#all_blogs"
end
