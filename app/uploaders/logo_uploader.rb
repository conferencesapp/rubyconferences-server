class LogoUploader < BaseUploader
  include CarrierWave::MiniMagick

  version :thumb do
    process resize_to_fit: [85, 85]
  end

  version :logo do
    process resize_to_fit: [634, 314]
  end
end
