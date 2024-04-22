class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top], unless: :admin_controller? #Adminという名前空間内のコントローラー（例: Admin::DashboardControllerなど）ではauthenticate_user!フィルターが適用されなくなる
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource) #view-page redirect after sign out
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #name key is permitted
  end
end
