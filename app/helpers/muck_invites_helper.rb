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
   
  def yahoo_oauth_for(user)
    user.authentications.find_by_provider('yahoo')
  end
 
  # Generates a javascript array of emails from gmail.  Values will be
  # put into a variable named 'gmail_contacts'
  def contacts_for_auto_complete(contacts, ignore_cache = false)
    contacts = contacts.collect{|contact| "'#{contact[:email]}'" }
    "var auto_complete_contacts = [#{contacts.join(',')}];"
  end
  
  def service_contacts(user, ignore_cache = false)
    self.gmail_contacts(user, ignore_cache) + self.yahoo_contacts(user, ignore_cache)
  end
  
  def gmail_contacts(user, ignore_cache = false)
    if @user_gmail_contacts && @user_gmail_contacts[user] && !ignore_cache
      @user_gmail_contacts[user]
    else
      contacts = []
      google = google_oauth_for(user)
      if google
        @user_gmail_contacts ||= {}
        result = google.access_token.get('https://www.google.com/m8/feeds/contacts/default/full?max-results=10000')
        if result.code == '200'
          xml_doc = Nokogiri::XML(result.body) {|config| config.options = Nokogiri::XML::ParseOptions::STRICT }
          contacts = xml_doc.xpath('//xmlns:entry').map do |entry|
            if !entry.xpath('gd:email').blank?
              { :name => entry.xpath('xmlns:title').inner_html,
                :email => entry.xpath('gd:email').attr('address').value }
            end
          end
          contacts.flatten!
        end
        @user_gmail_contacts[user] = contacts
      end
      contacts
    end
  end
  
  def yahoo_contacts(user, ignore_cache = false)
    if @user_yahoo_contacts && @user_yahoo_contacts[user] && !ignore_cache
      @user_yahoo_contacts[user]
    else
      contacts = []
      yahoo = yahoo_oauth_for(user)
      if yahoo
        @user_yahoo_contacts ||= {}
        begin
          result = yahoo.access_token.get("http://social.yahooapis.com/v1/user/#{yahoo.uid}/contacts?format=json&count=max")
        rescue OAuth::Problem => ex
          return contacts
        end
        if result.code == '200'
          json = ActiveSupport::JSON.decode(result.body) 
          contacts = parse_yahoo_contacts(json) 
        end
        @user_yahoo_contacts[user] = contacts
      end
      contacts
    end
  end
  
  
  def parse_yahoo_contacts(json)  
    contacts = []

    return contacts if json['contacts']['contact'].nil?  

    json['contacts']['contact'].each do |contact|   

      name = nil  
      email = nil  

      contact['fields'].each do |field|  
        field['type']  

        if field['type'] == 'name'  
          name = "#{field['value']['givenName']} #{field['value']['familyName']}"  
        end   

        if field['type'] == 'email'  
          email = field['value']  
        end  
      end  

      if(email)  
        name ||= email
        contacts << { :name => name, :email => email}        
      end  
    end  

    contacts  
  end
      
end