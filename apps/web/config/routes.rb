get '/', to: 'home#index'

resources :data, only: [:create, :index]