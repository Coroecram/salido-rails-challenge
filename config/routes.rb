Rails.application.routes.draw do
  root :to => "wines#index"
  get "wines/api_form" => "wines#api_form"
  post "wines/api_retrieval" => "wines#api_retrieval"
  resources :wines
end
