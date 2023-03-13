class UploadImageJob
  include Sidekiq::Job

  def perform(attacher_class, record_class, record_id, name, file_data)
    Shared::UploadImageService.call(attacher_class: attacher_class, record_class: record_class, record_id: record_id, name: name, file_data: file_data)
  end
end