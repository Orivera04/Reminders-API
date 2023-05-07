require 'rails_helper'

describe Setting do
   it { should validate_presence_of(:formatting_style_id) }
   it { should validate_presence_of(:description) }
end
