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
  
  def user_gmail_contacts_by_oauth(user)
    if user.google
      contacts = []
      user.google.portable_contacts.all.each do |contact|
        name = contact['name']['formatted'] rescue ''
        contact["emails"].each do |email|
          email_record = [name, "'#{email['value']}'"]
          contacts << email_record unless contacts.include?(email_record)
        end
      end
      contacts
    end
  end
  
end