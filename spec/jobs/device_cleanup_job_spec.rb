require 'rails_helper'

describe DeviceCleanupJob, type: :job do
  it "will invoke DeviceCleanup" do
    cleanup = double("DeviceCleanup", run: nil)
    allow(DeviceCleanup).to receive(:new).and_return(cleanup)

    DeviceCleanupJob.perform_now

    expect(DeviceCleanup).to have_received(:new)
  end
end
