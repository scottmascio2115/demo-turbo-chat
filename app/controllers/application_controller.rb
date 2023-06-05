class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    current_user.update(logged_in: true, text_color: "#%06x" % (rand * 0xffffff))
    messages_path
  end
end
