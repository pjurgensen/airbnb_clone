AirbnbClone::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => :registrations }
  root to: "users#home"

  resources :users
end
