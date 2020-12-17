Rails.application.routes.draw do

  #devise_for :customers, skip: :all
  devise_for :customers,
    skip: :all,
    :controllers => {
      :sessions => 'customers/sessions',
      :registrations => 'customers/registrations',
      :passwords => 'customers/passwords'
    }
  devise_scope :customer do
    get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
    delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
    post 'customers' => 'customers/registrations#create', as: 'customer_registration'
    get 'customers/password/new' => 'customers/passwords#new', as: 'new_customer_password'
  end

  #devise_for :customers

  devise_for :admins,
    skip: :all,
    :controllers => {
      :sessions => 'admin/sessions'
    }
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :customers do
    resources :articles, only: [:index, :show, :new, :create, :edit, :update] do
      resources :comments, only: [:index, :create, :update, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :create, :edit, :update, :destroy] do
      member do
    get :articles
    end
    end

  end

  namespace :admins do
    resources :articles, only: [:index, :show, :new, :create, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
  end

  root 'customers/articles#top'
  get 'about' => 'customers/articles#about', as: 'about'
  get 'article/thanx' => 'customers/articles#thanx', as: 'thanx'
  get 'customer/:id/mypage' => 'customers/customers#mypage', as: 'mypage'
  patch 'customar/out' => 'customers/customers#out', as: 'out'
  get 'customar/quit' => 'customers/customers#quit', as: 'quit'
  get 'admins' => 'admins/homes#top', as: 'top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end