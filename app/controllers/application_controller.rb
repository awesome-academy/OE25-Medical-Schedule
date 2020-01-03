class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def index; end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if current_user.present?

    store_location
    flash[:danger] = t "signin_require"
    redirect_to signin_path
  end

  def configure_permitted_parameters
    added_attrs = [:user_name, :full_name, :email, :phone, :address, :position,
      :experience, :room, :role, :decription, :password, :password_confirmation,
      :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
