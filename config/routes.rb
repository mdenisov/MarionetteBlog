MarionetteBlog::Application.routes.draw do
  
  scope module: 'frontend' do
    resources :posts
  end

  root to: 'frontend/home#index'
end
