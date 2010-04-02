module MuckInvitesHelper

  def contact_list(contacts)
    render :partial => 'invites/contact_list', :locals => { :contacts => contacts }
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
  
  def user_gmail_contacts_by_oauth(user)
    if user.google
      @gmail_contacts = user.google.portable_contacts.all.collect do |contact|
        contact["emails"].collect{ |email| "'#{email['value']}'" }
      end.flatten
    end
  end
  
end