Texter::Application.routes.draw do
  resources :contacts do
    resources :messages, :only => [:new, :create]
  end
  resources :messages, :only => [:index, :new, :create, :show]
end
