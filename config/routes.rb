Rails.application.routes.draw do
  root to: redirect('api-docs/index.html')
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :net_promoter_scores
    end
  end
end
