class UploadDummyDataJob
  include Sidekiq::Job

  def perform(skip=0, limit=5)
    result = Users::FetchDummyData.call(skip: skip.to_i,limit: limit.to_i)
    users = result.users
    users["users"].each do |user|
      Users::CreateUser.call(key: "user", user: user, hash_source: user["email"], uri: user["image"], model: "users")
    end
  end
end