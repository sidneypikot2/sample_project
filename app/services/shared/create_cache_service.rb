class Shared::CreateCacheService < ApplicationService

  def call
    if is_keyword_new?
      purge_cache()
    end
    collection = Rails.cache.read(context.key.pluralize)
    if !collection
      Rails.cache.write(context.key.pluralize + "_param_keyword",context.params[:keyword])
      collection = Rails.cache.fetch(context.key.pluralize) do
        eval((context.key + "Query").camelcase).search(context.params).to_a
      end
    end
    context[context.key.pluralize] = collection
  end

  private

  def is_keyword_new?
    cached_keyword = Rails.cache.read(context.key.pluralize + "_param_keyword")
    new_keyword = context.params[:keyword]
    cached_keyword != new_keyword
  end

  def purge_cache
    Rails.cache.delete(context.key.pluralize)
    Rails.cache.delete(context.key.pluralize + "_param_keyword")
  end
end