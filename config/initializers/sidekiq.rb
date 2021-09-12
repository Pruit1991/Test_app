# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'

redis_config = { url: ENV.fetch('SIDEKIQ_REDIS_URL') }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end

Sidekiq.default_worker_options = { retry: 3 }
Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(
    ::Digest::SHA256.hexdigest(username),
    ::Digest::SHA256.hexdigest(ENV.fetch('SIDEKIQ_USERNAME', ''))
  ) & ActiveSupport::SecurityUtils.secure_compare(
    ::Digest::SHA256.hexdigest(password),
    ::Digest::SHA256.hexdigest(ENV.fetch('SIDEKIQ_PASSWORD', SecureRandom.urlsafe_base64))
  )
end
