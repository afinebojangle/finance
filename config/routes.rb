Rails.application.routes.draw do
  
  get 'capm/index'

  get 'capm/capm_graph'

  devise_for :users
  
  get 'learn', to: 'learn#index'
  get 'learn/regression'
  get 'learn/capm'
  get 'learn/strategy'
  
  get 'welcome/home'
  get 'welcome/features'
  get 'welcome/about'
  get 'welcome/beta'

  root to: "welcome#home"
  
end
