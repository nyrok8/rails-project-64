# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://1475ded673b017c9086e7108040ba936@o4509152856047616.ingest.de.sentry.io/4509285759516752'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.send_default_pii = true
end
