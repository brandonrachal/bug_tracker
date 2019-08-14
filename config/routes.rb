Rails.application.routes.draw do

  root to: 'home#index'
  match '/', to: 'home#index', via: [:get, :post]

end
