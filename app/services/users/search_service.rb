class Users::SearchService < ApplicationService

  def call
    users = UserQuery.paginated_filter(context.params)
    context.users = users
  end
end