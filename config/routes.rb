Rails.application.routes.draw do
  root 'trains#index'

  resources :trains do
    collection do
      post 'import'
    end
  end

end
