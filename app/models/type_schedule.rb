# frozen_string_literal: true

# Purpose: Model for type schedule
class TypeSchedule < ApplicationRecord
  validates :name, presence: true

  DAILY = 1
  SPECIFIC = 2
end
