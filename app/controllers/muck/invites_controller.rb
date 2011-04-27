class Muck::InvitesController < ApplicationController
  unloadable
  before_filter :login_required
  
  def new
    flash.discard
    @page_title = t('muck.invites.new_invites', :app_name => MuckEngine.configuration.application_name)
    respond_to do |format|
      format.html { render :template => 'invites/new', :layout => 'popup' }
      format.pjs { render :template => 'invites/new', :layout => false }
      format.js { render :template => 'invites/new', :layout => false }
    end
  end

  def compose
    flash.discard
    respond_to do |format|
      format.html { render :template => 'invites/compose', :layout => 'popup' }
      format.pjs { render :template => 'invites/compose', :layout => false }
      format.js { render :template => 'invites/compose', :layout => false }
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
      format.js do
        @render_contacts_into = params[:render_contacts_into] || 'invite-contacts'
        render :template => 'invites/get_contacts', :layout => false
      end
    end
  end

  def create
    if params[:emails] && !params[:emails].blank?
      emails = params[:emails]
      emails = emails.join(', ') if emails.is_a?(Array)
      current_user.invite(params[:emails], params[:message], current_user)
      @message = t('muck.invites.create_success', :emails => emails, :app_name => MuckEngine.configuration.application_name)
    else
      @message = t('muck.invites.emails_empty')
    end
    respond_to do |format|
      format.html do
        flash[:notice] = @message
        redirect_back_or_default('/')
      end
      format.pjs { render :template => 'invites/create', :layout => false }
      format.js { render :template => 'invites/create', :layout => false }
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
