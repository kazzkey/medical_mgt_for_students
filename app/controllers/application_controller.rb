class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def current_user_student_or_user_officer
    current_user_student || current_user_officer
  end

  def authenticate!
    if user_officer_signed_in?
      authenticate_user_officer!
    else
      authenticate_user_student!
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                        :type,
                                                        :school_id,
                                                        :student_id,
                                                        :birth_date,
                                                        :grade,
                                                        :blood_type,
                                                        :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,
                                                              :type,
                                                              :school_id,
                                                              :student_id,
                                                              :birth_date,
                                                              :grade,
                                                              :blood_type,
                                                              :profile_image])
  end
end
