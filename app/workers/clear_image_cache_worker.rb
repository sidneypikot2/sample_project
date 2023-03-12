class ClearImageCacheWorker
  include Sidekiq::Worker

  def perform(*args)
    file_system = Shrine.storages[:cache]
    file_system.clear! { |path| path.mtime < Time.now - 60 }
  end
end