class Users::SearchUsers
  include Interactor::Organizer

  organize Shared::CreateCacheService, Users::SearchService, Shared::PaginationService
end