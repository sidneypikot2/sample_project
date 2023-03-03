class Users::GetUsers
  include Interactor::Organizer

  organize Users::GetService
end