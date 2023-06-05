Rails.application.routes.draw do
  # 会員側deviseルーティング
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者側deviseルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # 会員側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :post_recipes, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :members, only: [:index, :show, :edit, :update] do
      collection do
        get 'my_page'
        get 'quit'
        patch 'out'
      end
    end
    resources :relationships, only: [:create, :destroy] do
      collection do
        get 'followings'
        get 'followers'
      end
    end
  end
  # 管理者側ルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :post_recipes, only: [:new, :create, :index, :show, :destroy, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
