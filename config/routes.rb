Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries, defaults: { format: 'json' }
  
  get '/chats', to: 'chat#index'
end
