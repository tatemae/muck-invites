module MuckInvitesHelper

  def contact_list(contacts)
    if MuckInvites.configuration.use_gravatar_in_photo_list
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
  
  def contact_container(contacts)
    render :partial => 'invites/contact_container', :locals => { :contacts => contacts }
  end
  
  def google_oauth_for(user)
    user.authentications.find_by_provider('google')
  end
   
  # Generates a javascript array of emails from gmail.  Values will be
  # put into a variable named 'gmail_contacts'
  def gmail_contacts_for_auto_complete(user, ignore_cache = false)
    return unless google_oauth_for(user)
    contacts = gmail_contacts(user, ignore_cache).collect{|contact| "'#{contact[:email]} (#{contact[:name]})'" }
    "var gmail_contacts = [#{contacts.join(',')}];"
  end
  
  def gmail_contacts(user, ignore_cache = false)
    if @user_gmail_contacts && @user_gmail_contacts[user] && !ignore_cache
      @user_gmail_contacts[user]
    else
      google = google_oauth_for(user)
      if google
        @user_gmail_contacts ||= {}
        result = google.access_token.get('https://www.google.com/m8/feeds/contacts/default/full?max-results=10000')
        contacts = []
        if result.code == '200'
          xml_doc = Nokogiri::XML(result.body) {|config| config.options = Nokogiri::XML::ParseOptions::STRICT }
          contacts = xml_doc.xpath('//xmlns:entry').map do |entry|
            {
              :name => entry.xpath('xmlns:title').inner_html,
              :email => entry.xpath('gd:email').attr('address').value
            }
          end
        end
        @user_gmail_contacts[user] = contacts
      end
    end
  end
    
end