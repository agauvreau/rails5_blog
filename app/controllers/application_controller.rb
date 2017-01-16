class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #to catch ugly exceptions and use better looking flash messages
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  
  protected
  #empty in ApplicationController since we will override it in the article controler, or any other after that.
  def resource_not_found
  end
  
end
