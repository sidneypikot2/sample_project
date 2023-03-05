class Users::SearchService < ApplicationService

  def call
    users = Rails.cache.read(context.key.pluralize)
    context.users = users
  end
end