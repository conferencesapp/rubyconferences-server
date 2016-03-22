require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it { should validate_presence_of(:body) }
end
