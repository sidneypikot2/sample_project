class Users::UpdateUser
  include Interactor::Organizer

  organize Users::GetService, Users::UpdateService
end