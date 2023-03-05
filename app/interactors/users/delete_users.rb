class Users::DeleteUsers
  include Interactor::Organizer

  organize Users::GetService, Users::DeleteService, Shared::PurgeCacheService
end