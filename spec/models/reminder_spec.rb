require 'rails_helper'

describe Reminder do
  it { should validate_presence_of(:chat_id) }
end
