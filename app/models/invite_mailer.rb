class InviteMailer < ActionMailer::Base
  unloadable
  
  layout 'email_default'
  default_url_options[:host] = GlobalConfig.application_url
  
  def invite_notification(user, email)
    setup_email(email)
    subject   I18n.t('muck.invites.invite', :inviter => user.full_name, :app_name => GlobalConfig.application_name)
    body      :user => user
  end

  def invited_joined_notification(user, inviter)
    setup_email(inviter.email)
    subject   I18n.t('muck.invites.invited_joined', :user => inviter.full_name)
    body      :user => user, :inviter => inviter
  end
  
  protected

  def setup_email(email)
    recipients    email
    from          "#{GlobalConfig.from_email_name} <#{GlobalConfig.from_email}>"
    sent_on       Time.now
    content_type "text/html" # There is a bug in Rails that prevents multipart emails from working inside an engine.  See: https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/2263-rails-232-breaks-implicit-multipart-actionmailer-tests#ticket-2263-22
  end

end
