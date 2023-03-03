class Users::DeleteService < ApplicationService

  def call
    users = context.users
    if users.destroy_all
      context.message = "Users successfully deleted"
    else
      context.message = "Something went wrong"
      context.fail!
    end
  end
end