Rails.application.routes.draw do

  resources :regions
  
  resources :animals do
    resources :sightings
  end

  root "animals#index"

end
