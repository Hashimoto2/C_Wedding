Rails.application.routes.draw do

  devise_for :customers
  get 'homes/top'
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  # devise_for :customers, skip: :all
  # devise_scope :customers do
  #   get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customers_session'
  #   post 'customers/sign_in' => 'customers/sessions#create', as: 'customers_session'
  #   delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customers_session'
  #   get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customers_registration'
  #   post 'customers' => 'customers/registrations#create', as: 'customers_registration'
  #   get 'customers/password/new' => 'customers/passwords#new', as: 'new_customers_password'
  # end

  # namespace :customers do
  #   resources :articles, only: [:index, :show, :new, :create, :edit, :update]
  #   resources :customers, only: [:show, :new, :create, :edit, :update, :destroy]
  # end
  # root 'customers/articles#top'
  # get 'about' => 'customers/articles#about', as: 'about'
  # get 'customers/articles/thanx' => 'customers/articles#thanx', as: 'thanx'
  get 'admins' => 'admins/homes#top', as: 'top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end