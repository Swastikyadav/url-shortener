Rails.application.routes.draw do
  root "links#index"
  resources :links, only: [:create, :show, :index], param: :slug
end
