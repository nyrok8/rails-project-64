# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://7e98e5964cd7cbf2a9bf7036ccfd114f@o4509152856047616.ingest.de.sentry.io/4509153550794832'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.send_default_pii = true
end
