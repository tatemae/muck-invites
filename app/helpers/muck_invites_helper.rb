module MuckInvitesHelper

  def contact_list(contacts)
    if GlobalConfig.use_gravatar_in_photo_list
      render :partial => 'invites/contact_list_gravatar', :locals => { :contacts => contacts }
    else
      render :partial => 'invites/contact_list', :locals => { :contacts => contacts }
    end
  end
  
  def invite_ajax_message_container
    output_message_container('invite-messages', 'invite-messages-container')
  end
  
  def invite_ajax_message(message)
    %Q{
    jQuery('#invite-messages-container').show();
    jQuery('#invite-messages').html('#{escape_javascript(message)}');
    }
  end
  
end