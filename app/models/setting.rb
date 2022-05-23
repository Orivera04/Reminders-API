class Setting < ApplicationRecord
  validates :formatting_style_id, presence: true

  belongs_to :formatting_style, class_name: "FormattingStyle"
end
