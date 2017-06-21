Rails.application.routes.draw do
  root 'quotes#index'
  mount ActionCable.server => "/cable"
end
