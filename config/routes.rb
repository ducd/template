Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :contacts

    root to: "users#index"
  end

end
