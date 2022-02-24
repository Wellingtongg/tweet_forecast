Rails.application.routes.draw do
  post 'weather/tweet', to: 'weather#tweet'
end
