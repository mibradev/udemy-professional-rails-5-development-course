Rails.application.routes.draw do
  resources :portfolios, except: :show
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs

  get 'about-me' => 'pages#about'
  get 'contact' => 'pages#contact'

  root 'pages#home'
end
