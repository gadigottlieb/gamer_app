Rails.application.routes.draw do
  root to: 'games#home'
  get 'games/search', to: 'games#search'
  get 'games/:id', to: 'games#show'
end
