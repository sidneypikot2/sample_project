class Shared::PaginationService < ApplicationService

  def call
    collection = context[context.key.pluralize]
    params = context.params
    collection = Kaminari.paginate_array(collection).page(params[:page]).per(params[:per_page])
    context[context.key.pluralize] = collection
  end
end