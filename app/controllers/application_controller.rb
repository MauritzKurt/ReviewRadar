class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar_image])
  end

  private

  def skip_pundit?
    devise_controller?
  end

  def user_not_authorized
    unless performed?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_url)
    end
  end
end
