Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit] do
    resources :genres, only: [:new, :create, :update, :edit, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
