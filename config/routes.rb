require "sidekiq/web"
require "sidekiq/cron/web"

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production? || Rails.env.staging?

  mount Sidekiq::Web => "/sidekiq"

  resources :downloads, only: [:index]
end
