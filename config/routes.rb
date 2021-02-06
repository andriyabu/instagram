Rails.application.routes.draw do
  devise_for :users
  resources :pics do
    member do
      put "like", to: "pics#upvote"
    end
  end
  get 'mypics', to: 'pics#mypic'

  root 'pics#index'
end
