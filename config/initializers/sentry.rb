# in an initializer, like sentry.rb
sentry_configs = YAML.safe_load(ERB.new(File.read(Rails.root.join('config', 'sentry.yml'))).result)
Raven.configure do |config|
  config.dsn = sentry_configs[Rails.env]['protocol'] + '://' + sentry_configs[Rails.env]['public'] + ':' + sentry_configs[Rails.env]['secret'] + '@' +
               sentry_configs[Rails.env]['url'] + '/' + sentry_configs[Rails.env]['project'].to_s
  config.environments = %w[staging production]

  config.async = lambda { |event|
    SentryJob.perform_async(event.to_hash)
  }
end
