# frozen_string_literal: true

namespace :sentry do
  desc 'sentry test'
  task test: :environment do
    begin
      1 / 0
    rescue ZeroDivisionError => e
      Sentry.capture_exception(e)
    end

    Sentry.capture_message('test message')
  end
end
