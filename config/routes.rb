AirbnbClone::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => :registrations }
  root to: "rentals#index"

  resources :users
  resources :rentals
end
