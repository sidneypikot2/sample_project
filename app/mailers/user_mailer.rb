class UserMailer < ApplicationMailer

  def delete_user
    @user = params[:user]
    mail(to: @user[:email], subject: 'Account deletion')
  end
end
