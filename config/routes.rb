Rails.application.routes.draw do
#customer
  devise_for :customers,skip: [:password,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  #admin
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :customers, only: %i[show index edit update]
  resources :items, except: %i[destroy]
  resources :genres, only: %i[create index edit update]
  resources :orders, only: %i[show index update]
  resources :order_details, only: %i[update]
  get '/' => 'homes#top'
end

scope module: :public do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :customers, only: %i[edit update]
  get 'customers/my_page' => 'customers#show'
  patch 'customers/withdraw' => 'customers#withdraw'
  get 'customers/unsubscribe' => 'customers#unsubscribe'

  resources :ships, except: %i[new show]

  resources :orders, except: %i[update destroy]
  get 'orders/complete' => 'orders#complete'

  resources :carts_items, except: %i[show edit new]
  delete 'destroy_all' => 'homes#destroy_all'

  resources :items, only: %i[index show]
end

end
