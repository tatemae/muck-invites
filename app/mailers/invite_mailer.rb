class InviteMailer < ActionMailer::Base

  def invite_notification(user, message, email)
    @user = user
    @message = message
    mail(:to => email, :subject => I18n.t('muck.invites.invite', :inviter => user.full_name, :app_name => MuckEngine.configuration.application_name)) do |format|
      format.html
      format.text
    end
  end

  def invited_joined_notification(user, inviter)
    @user = user
    @inviter = inviter
    mail(:to => inviter.email, :subject => I18n.t('muck.invites.invited_joined', :user => inviter.full_name, :app_name => MuckEngine.configuration.application_name)) do |format|
      format.html
      format.text
    end
    
  end
  
end