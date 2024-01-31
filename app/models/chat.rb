class Chat < ApplicationRecord
  belongs_to :setting

  validates :name, presence: true
  validates :description, presence: true
  validates :setting, presence: true
  validates :chat_id, presence: true
end
