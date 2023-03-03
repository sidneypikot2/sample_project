class UploadDummyDataJob
  include Sidekiq::Job

  def perform(skip=0, limit=5)
    result = Users::UploadDummyData.call(skip: skip.to_i,limit: limit.to_i)
  end
end