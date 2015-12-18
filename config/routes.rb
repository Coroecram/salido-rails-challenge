Rails.application.routes.draw do
  root :to => "wines#index"
  resources :wines
end
