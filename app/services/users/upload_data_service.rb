class Users::UploadDataService < ApplicationService
  attr_reader :limit, :skip

  def initialize(limit=5, skip=0)
    @limit = limit
    @skip  = skip
  end

  def call
    response = RestClient.get "https://dummyjson.com/users?limit=#{limit}&skip=#{skip}"
    result = JSON.parse response
  end
end