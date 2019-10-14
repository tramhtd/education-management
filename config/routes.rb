Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'api' do
    # scope 'schools' do
    #   get '', to: 'schools#index'
    #   get '/:id', to: 'schools#show'
    #   post '', to: 'schools#create'
    #   put ':/id', to: 'schools#update'
    #   delete '', to: 'schools#destroy'
    # end
    resources :schools
  end
end
