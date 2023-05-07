# frozen_string_literal: true

# Purpose: Model for formatting style
class FormattingStyle < ApplicationRecord
  validates :name, presence: true
end
