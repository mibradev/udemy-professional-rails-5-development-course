Rails.application.routes.draw do
  resources :portfolios, except: :show do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    get :toggle_status, on: :member
  end

  get 'about-me' => 'pages#about'
  get 'contact' => 'pages#contact'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'account', sign_up: 'signup' }
  root 'pages#home'
end
