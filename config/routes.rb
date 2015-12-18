Rails.application.routes.draw do
  root :to => "wines#index"
  get "wines/from_api" => "wines#retrieve_from_api"
  resources :wines
end
