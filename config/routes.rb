Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  get '/books/tag/:id', to: 'books#index', as: 'tag'
  resources :books, only: [:new, :create, :index, :show, :edit] do
    resources :book_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
