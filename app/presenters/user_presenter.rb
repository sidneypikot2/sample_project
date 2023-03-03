# class UserPresenter
#   attr_accessor :user
#   def initialize(user)
#     @user = user
#   end
#   def name
#     "#{user.last_name}, #{user.first_name} #{user.maiden_name}"
#   end

# end

class UserPresenter < SimpleDelegator
  include ActionView::Helpers::TextHelper

  def name
    "#{last_name}, #{first_name} #{maiden_name}"
  end

  def complete_address
    "#{address.address}, #{address.state}, #{address.city}, #{address.postal_code}"
  end

  def company_details
    "#{company.title} at #{company.name}"
  end
end