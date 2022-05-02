class Setting < ApplicationRecord
  belongs_to :formatting_style, class_name: "FormattingStyle"
end
