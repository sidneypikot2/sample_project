class Users::CreateUser
  include Interactor::Organizer

  organize Users::CreateService
end