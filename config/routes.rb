Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  get '/books/tag/:id', to: 'books#index', as: 'tag'

  resources :users
  put "/users/:id/hide" => "users#hide", as: 'users_hide'

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :books, only: [:new, :create, :destroy, :index, :show, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
