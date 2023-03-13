class Users::UpdateService < ApplicationService

  def call
    user = context.user
    if context.attributes[:image].class == String
      context.attributes[:image] = Shrine.remote_url(context.attributes[:image])
    end
    user.assign_attributes(context.attributes)
    if context.image
      user.image = context.image
    end
    if user.save
      context.user = user
      context.message = "Update Successful"
    else
      context.message = "Something went wrong"
      context.fail!
    end
  end

end