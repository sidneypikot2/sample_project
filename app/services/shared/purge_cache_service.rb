class Shared::PurgeCacheService < ApplicationService

  def call
    Rails.cache.delete(context.key.pluralize)
    Rails.cache.delete(context.key.pluralize + "_param_keyword")
  end
end