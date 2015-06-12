require "rails_helper"

describe DeviceCreator do
  describe "#create" do
    context "when params are given" do
      context "when device already exists" do
        it "will not create a new device" do
          device = create(:device)
          params = {
            token: device.token,
            conference_type: device.conference_type
          }
          creator = DeviceCreator.new(params)

          creator.create

          expect(Device.count).to eq(1)
        end
      end

      context "when no device exists" do
        it "will create a device" do
          token = "something"
          conference_type = "ruby"
          params = {
            token: token,
            conference_type: conference_type
          }
          creator = DeviceCreator.new(params)

          creator.create

          expect(Device.count).to eq(1)
          device = Device.last
          expect(device.token).to eq(token)
          expect(device.conference_type).to eq(conference_type)
        end
      end
    end

    context "when params are missing" do
      context "when conference_type is missing" do
        context "when device exists in system" do
          it "will not create a new device" do
            device = create(:device)
            params = {
              token: device.token,
              conference_type: nil
            }
            creator = DeviceCreator.new(params)

            creator.create

            expect(Device.count).to eq(1)
          end
        end

        context "when no device exists" do
          it "will create a new device with conference_type as ruby" do
            token = "some-token"
            params = {
              token: token,
              conference_type: nil
            }
            creator = DeviceCreator.new(params)

            creator.create

            expect(Device.count).to eq(1)
            device = Device.last
            expect(device.token).to eq(token)
            expect(device.conference_type).to eq("ruby")
          end
        end
      end
    end
  end
end
