module Countdown
  countdown_config = Rails.application.config_for(:countdown)
                                      .with_indifferent_access

  MIN_VAL = countdown_config[:min]
  MAX_VAL = countdown_config[:max]
  WAIT_MS = countdown_config[:wait_ms]
end
