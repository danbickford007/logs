Logs::Engine.routes.draw do
  resources :errors
  root to: "errors#index"
end
