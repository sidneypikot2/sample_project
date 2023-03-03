class Users::GetService < ApplicationService

  def call
    if context.ids
      get_multiple
    else
      get_one
    end
  end

  private
  def get_multiple
    context.ids = context.ids.split(',')
    users = UserQuery.filter_by_ids(context.ids)
    context.users = users
  end

  def get_one
    user = UserQuery.filter_by_ids(context.id).first
    if user
      context.user = user
    else
      context.fail!(message: "User not found")
    end
  end
end