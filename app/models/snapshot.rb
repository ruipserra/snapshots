class Snapshot < ApplicationRecord
  countdown_config = Rails.application.config_for(:countdown)
                                      .with_indifferent_access

  MIN_VAL = countdown_config[:min]
  MAX_VAL = countdown_config[:max]

  scope :by_insert_order, -> { order(:created_at) }

  validates :seconds,
    presence: true,
    numericality: {
      greater_than_or_equal_to: MIN_VAL,
      less_than_or_equal_to: MAX_VAL,
    }
end
