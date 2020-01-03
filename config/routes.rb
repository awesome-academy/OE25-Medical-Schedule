Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#about"

    devise_for :users, controllers: {
      registrations: "users/registrations",
      confirmations: "users/confirmations",
      sessions: "users/sessions"
    }
    get "admins/dashboard", to: "admins#index"

    resources :users, only: :show
    resources :patients do
      resources :medical_records
    end
    resources :doctors do
      resources :comments
      resources :schedules
    end
    resources :staffs
    resources :appointments
    resources :admins
    namespace :admin do
      resources :staffs
      resources :admins
      resources :doctors
    end
  end
end
