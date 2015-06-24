Rails.application.routes.draw do

  resources :animals do
    resources :sightings
  end

  root "animals#index"

end
