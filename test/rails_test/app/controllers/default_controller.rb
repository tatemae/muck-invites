class DefaultController < ApplicationController

  layout 'default'

  def index
    @user = User.create
  end
  
end