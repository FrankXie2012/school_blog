SchoolBlog::Application.routes.draw do
  devise_for :users
  resources :users

  resources :posts do
    resources :comments
  end

  match 'admins' => 'admins#index'
  match 'edit_user_admin' => 'admins#edit_user'
  match 'set_to_admin' => 'admins#set_to_admin'
  match 'set_to_common_user' => 'admins#set_to_common_user'
  root :to => "users#all_blogs"
end
