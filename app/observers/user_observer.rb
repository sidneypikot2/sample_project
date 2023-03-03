class UserObserver < ActiveRecord::Observer
  def after_destroy(user)
    UserMailer.with(user: {first_name: user.first_name, email: user.email}).delete_user.deliver_later(wait: 30.minutes)
  end
end