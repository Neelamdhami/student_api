Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "users/index", to: "users#index"
  get "users/show/:id", to: "users#show"
  post "users/create", to: "users#create"
  put "users/update/:id", to: "users#update"
  delete "users/destroy/:id", to: "users#destroy"

  get "educations/index", to: "educations#index"
  get "educations/show/:id", to: "educations#show"
  post "educations/create", to: "educations#create"
  put "educations/update/:id", to: "educations#update"
  delete "educations/destroy/:id", to: "educations#destroy"
end
