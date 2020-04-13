REDIRECT_ROOT = Rails.env.development? ? "http:localhost:3001" :  "https://chat.profeit.com" 
Rails.application.routes.draw do
  root to: redirect("https://chat.profeit.com")

  resources :messages, only: [:index, :create]
end
