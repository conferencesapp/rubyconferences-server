require 'rails_helper'

RSpec.describe Conference, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:twitter_username) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
