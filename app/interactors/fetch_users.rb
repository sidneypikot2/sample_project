class FetchUsers
  include Interactor

  def call
    response = RestClient.get "https://dummyjson.com/users?limit=#{context.limit}&skip=#{context.skip}"
    result = JSON.parse response

    if response
      context.users = result
    else
      context.fail!
    end
  end

  # def rollback
  #   context.order.destroy
  # end
end