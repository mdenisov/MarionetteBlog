MarionetteBlog::Application.routes.draw do
  
  scope module: 'frontend' do
    resources :posts do
      resources :comments
    end
    resources :tags
    resources :categories
    resources :uploads, only: [:show] do
      collection do
        post :upload_file
      end
    end
  end

  root to: 'frontend/home#index'
end
