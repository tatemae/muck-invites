class Muck::InvitesController < ApplicationController
  unloadable
  before_filter :login_required
  
  def new
    flash.discard
    @page_title = t('muck.invites.new_invites', :app_name => GlobalConfig.application_name)
    respond_to do |format|
      format.html { render :template => 'invites/new' }
      format.pjs { render :template => 'invites/new', :layout => false }
      format.js { render :template => 'invites/new', :layout => false }
    end
  end

  def get_contacts
    @success = true
    begin
      @contacts = User.get_contacts(params[:get_contacts][:email], params[:get_contacts][:password])
      if @contacts.blank?
        @message = t('muck.invites.no_contacts_found')
        @success = false
      end
    rescue Contacts::AuthenticationError => ex
      @success = false
      @message = ex.to_s
    end    
    respond_to do |format|
      format.html do
        flash[:error] = @message if @message
        render :template => 'invites/get_contacts'
      end
      format.json { render :json => { :success => @success, :message => @message, :contacts => @contacts.as_json } }
      format.js { render :template => 'invites/get_contacts', :layout => false }
    end
  end

  def create
    if params[:emails]
      emails = params[:emails]
      emails = emails.join(', ') if emails.is_a?(Array)
      current_user.invite(params[:emails], current_user)
      message = t('muck.invites.create_success', :emails => emails, :app_name => GlobalConfig.application_name)
    end
    respond_to do |format|
      format.html do
        flash[:notice] = message
        redirect_to('/')
      end
      format.pjs { render :text => message }
      format.js { render :text => message }
    end 
    
  rescue ActiveRecord::RecordInvalid => ex
    if @invite
      errors = @invite.errors.full_messages.to_sentence
    else
      errors = ex
    end
    flash[:error] = t('muck.invites.create_error', :errors => errors)
    respond_to do |format|
      format.html { render :template => 'invites/new' }
      format.pjs { render :template => 'invites/new', :layout => false }
      format.js { render :template => 'invites/new', :layout => false }
    end
  end

end
