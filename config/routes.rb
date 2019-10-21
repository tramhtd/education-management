Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'api' do
    resources :schools

    scope 'auth' do
      post 'register', to: 'authentication#register'
      post 'login', to: 'authentication#login'
    end
  end
end
