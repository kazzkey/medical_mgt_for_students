class HomesController < ApplicationController
  before_action :authenticate_user_student!, only: %i[index]
  before_action :authenticate_user_student!, only: %i[index]
  def index
  end
end
