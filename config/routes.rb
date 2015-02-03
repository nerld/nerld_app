Rails.application.routes.draw do
  resources :remote_labs

  # Internal Slave Routes
  post 'slave/switch/toggle' => 'slaves#switch_toggle'

  # External API Routes
  post 'api/register_slave' => 'api#register_slave'
  get 'api/get_commands/:id' => 'api#get_commands'
  post 'api/complete_command' => 'api#complete_command'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
