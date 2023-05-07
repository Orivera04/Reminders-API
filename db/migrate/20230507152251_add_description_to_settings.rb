# frozen_string_literal: true

# Purpose: Add description to settings
class AddDescriptionToSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :settings, :description, :string
  end
end
