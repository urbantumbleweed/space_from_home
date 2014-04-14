SpaceFromHome::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  ENV['GOOGLE_API_KEY'] = 'AIzaSyAH38Ev4_oSahxXzn27tEcaA1fUmLwZRr8'
  ENV['CUSTOM_SEARCH_ID'] = '008746174364381669212:aznfrmyxwcq'


  AlchemyAPI.key = '4a7739e43a9d73c15ac064f5cff7ce44a5b7b229'
  AlchemyAPI.configure do |config|
    config.apikey = '4a7739e43a9d73c15ac064f5cff7ce44a5b7b229'
    config.output_mode = :xml # not yet supported
  end

end
