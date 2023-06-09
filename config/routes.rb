Rails.application.routes.draw do
  # 会員側deviseルーティング
  devise_for :members, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#new_guest'
  end

  # 管理者側deviseルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # 会員側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'search' => 'searches#search'
    resources :post_recipes, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :members, only: [:index, :show, :edit, :update] do
      collection do
        get 'my_page'
        get 'quit'
        patch 'out'
      end
      member do
        get 'favorites'
        get 'followings'
        get 'followers'
      end
      resource :relationships, only: [:create, :destroy]
      resources :reports, only: [:new, :create]
    end
  end
  # 管理者側ルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :post_recipes, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :members, only: [:index, :show] do
      member do
        patch 'out'
        patch 'resume'
      end
    end
    resources :reports, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
