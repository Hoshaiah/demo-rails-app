Rails.application.routes.draw do
  get "/health", to: "health#show"
  get "/echo",   to: "echo#show"
end
