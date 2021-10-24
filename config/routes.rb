Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :recipes, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end
  
  get 'tag_index',to: 'recipes#tag_index'

  get 'search' => 'recipes#search' #ソート機能

  get 'all_search' => 'searchs#all_search' #検索機能

  resources :tags do
    get 'recipes', to: 'recipes#tag_search'
  end
end
