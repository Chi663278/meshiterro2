Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions' #admin/sessionsコントローラーをsessionsという名前で使用するように指定している
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index' #管理者ダッシュボードへ  /admin/dashbordsにアクセスするとadmin/dashboards_controller.rbのindexアクションを処理
    resources :users, only: [:destroy] #顧客削除
  end

  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

end
