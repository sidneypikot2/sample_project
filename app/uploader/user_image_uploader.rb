class UserImageUploader < Shrine
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size  1*1024*1024
  end
  Rails.logger.info()
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),
  }
  Attacher.promote_block do
    UploadImageJob.perform_async(self.class.name, "User", record.id, name, file_data)
  end
 end