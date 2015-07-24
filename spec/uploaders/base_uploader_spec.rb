require "spec_helper"

describe BaseUploader do
  describe "store_dir" do
    it "should have id_partition included" do
      model_id = 123
      uploader = BaseUploader.new
      model = double(id: model_id)
      allow(uploader).to receive(:model).and_return(model)

      expect(uploader.store_dir).to match(/000\/000\/#{model_id}\/#{model_id}/)
    end

    it "should have another id_partition when id is higher" do
      model_id = 1001
      uploader = BaseUploader.new
      model = double(id: model_id)
      allow(uploader).to receive(:model).and_return(model)

      expect(uploader.store_dir).to match(/000\/001\/001\//)
    end
  end
end
