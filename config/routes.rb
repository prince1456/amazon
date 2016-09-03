Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/' => "welcome#index"

  get '/about' => "welcome#about", as: :about
  get '/services' => "welcome#services", as: :services
  get '/contact' => 'contact#contact', as: :contact
  post '/contact' => 'contact#create', as: :create







  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :products do
    resources :reviews, only: [:create, :destroy]
    resources :favourites, only: [:create, :destroy]


  end


  resources :reviews, only: [] do

    resources :likes, only: [:create, :destroy]
  end
  # resources :products
  # get '/products/new' => 'products#new', as: :new_products
  # post '/products' => 'products#create', as: :products
  # get '/products/:id' => 'products#show', as: :product
  # get '/products' => 'products#index'
  # get '/products/:id' => 'products#edit', as: :edit_products
  # patch '/products/:id' => 'products#update'
  # delete '/products/:id' => 'products#destroy'

  get '/users/new' => "users#new", as: :new_users


root 'home#index'
end
# get '/questions/new' => "questions#new", as: :new_question
# post '/questions' => "questions#create", as: :questions
# get "/questions/:id" => "questions#show",   as: :question
# get'/questions' => 'questions#index'
# get '/questions/:id/edit' => "questions#edit", as: :edit_question
# patch '/questions/:id' => "questions#update"
# delete '/questions/:id' => 'questions#destroy'
