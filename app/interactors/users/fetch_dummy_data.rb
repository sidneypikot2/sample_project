class Users::FetchDummyData
  include Interactor::Organizer

  organize Users::FetchDummyDataService

  after do
    skip_counter = context.skip + context.limit
    if skip_counter < context.users['total']
      UploadDummyDataJob.perform_async(skip_counter, context.limit)
    end
  end
end