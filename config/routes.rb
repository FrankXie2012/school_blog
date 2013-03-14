SchoolBlog::Application.routes.draw do
  devise_for :users
  resources :users

  resources :posts do
    resources :comments
  end

  root :to => "users#index"
end
