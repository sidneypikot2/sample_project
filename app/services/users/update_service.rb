class Users::UpdateService < ApplicationService

  def call
    user = context.user
    user.assign_attributes(context.attributes)
    if user.save
      context.user = user
      context.message = "Update Successful"
    else
      context.message = "Something went wrong"
      context.fail!
    end
  end

end