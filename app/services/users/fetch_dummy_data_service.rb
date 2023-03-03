class Users::FetchDummyDataService < ApplicationService

  def call
    response = RestClient.get "https://dummyjson.com/users?skip=#{context.skip}&limit=#{context.limit}"
    result = JSON.parse response
    if result['users'].present?
      context.users = result
    else
      context.fail!
    end
  end
end