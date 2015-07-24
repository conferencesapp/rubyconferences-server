class BaseUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    File.join(
      "uploads",
      model.class.to_s.underscore,
      mounted_as.to_s,
      id_partition.to_s,
      model.id.to_s
    )
  end

  def extension_white_list
    %w(jpg jpeg gif png svg)
  end

  private

  def id_partition
    id = model.id
    if id.is_a? Integer
      ("%09d" % id).scan(/\d{3}/).join("/")
    end
  end
end
