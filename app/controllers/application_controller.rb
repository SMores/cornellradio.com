class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  before_action :set_mailchimp

  def set_mailchimp
    @mailchimp = Mailchimp::API.new(MC_API_KEY)
  end
end
