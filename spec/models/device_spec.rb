require 'rails_helper'

describe Device, type: :model do
  describe "validations" do
    describe "token" do
      it { should validate_presence_of(:token) }

      it "will not create device with same token and conference_type" do
        token = "same-token"
        ruby_conference_type = "ruby"
        create(:device, token: token, conference_type: ruby_conference_type)
        device = build(
          :device,
          token: token,
          conference_type: ruby_conference_type
        )

        expect(device).not_to be_valid
      end

      it "will allow to use same token with different conference_type" do
        token = "same-token"
        ruby_conference_type = "ruby"
        js_conference_type = "js"
        create(:device, token: token, conference_type: ruby_conference_type)
        device = build(
          :device,
          token: token,
          conference_type: js_conference_type
        )

        expect(device).to be_valid
      end
    end
  end

  describe "conference_type" do
    it "has ruby and js as an option" do
      expect(Device.conference_types["ruby"]).to eq(0)
      expect(Device.conference_types["js"]).to eq(1)
    end
  end
end
