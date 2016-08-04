class Snapshot < ApplicationRecord
  countdown_config = Rails.application.config_for(:countdown)
                                      .with_indifferent_access

  scope :by_insert_order, -> { order(:created_at) }

  validates :seconds,
    presence: true,
    numericality: {
      greater_than_or_equal_to: Countdown::MIN_VAL,
      less_than_or_equal_to: Countdown::MAX_VAL,
    }
end
