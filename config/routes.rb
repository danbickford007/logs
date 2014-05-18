Logs::Engine.routes.draw do

  resources :request_data
  resources :errors do
  end
  root to: "errors#index"
end
