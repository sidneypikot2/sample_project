class Users::SearchUsers
  include Interactor::Organizer

  organize Users::SearchService
end