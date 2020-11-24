Rails.application.routes.draw do
  resources :tiny_urls, only: [:index, :create], param: :mini_url

  get ':mini_url', to: 'tiny_urls#show', param: :mini_url, as: :show
  get ':mini_url/info', to: 'tiny_urls#info', param: :mini_url, as: :info

  root to: 'tiny_urls#index'
end
