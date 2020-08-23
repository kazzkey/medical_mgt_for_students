class HomesController < ApplicationController
  before_action :authenticate!, only: %i[index]

  def index
  end

  private

  def authenticate!
    if user_officer_signed_in?
      authenticate_user_officer!
    else
      authenticate_user_student!
    end
  end
end
