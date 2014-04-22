Texter::Application.routes.draw do
  root to: 'messages#index'

  resources :contacts do
    resources :messages, :only => [:new, :create]
  end
  resources :messages, :only => [:index, :new, :create, :show]
end
