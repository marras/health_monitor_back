get '/', to: 'home#index'

resources :data, only: [:create, :index]
resource :sessions, only: [:new, :create, :destroy]