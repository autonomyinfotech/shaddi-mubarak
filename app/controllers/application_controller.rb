class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :set_language

  def after_sign_in_path_for(*)
    dashboard_index_path
  end

  def after_sign_out_path_for(*)
    sign_out_path
  end

  private

  def set_language
    I18n.locale = Hall.first.language if Hall.first
  end
end
