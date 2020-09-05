class ChecksController < ApplicationController
  before_action :authenticate_user_officer!
  before_action :set_check, only: %i(show edit update)

  def index
    @q = Check.page(params[:page]).per(10).ransack(params[:q])
    @checks = @q.result(distinct: true).includes(:user_student)
  end

  def new
    @check = current_user_officer.checks.build
  end

  def create
    @check = current_user_officer.checks.build(check_params)
    if @check.save
      redirect_to checks_path, notice: "Successfully saved."
    else
      render :new
    end
  end

  def show
  end

  def update
    if @check.update(check_params)
      redirect_to checks_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @check.destroy
    redirect_to check_path, notice: 'Successfully destroyed.'
  end



  private

  def set_check
    @check = Check.find(params[:id])
  end

  def check_params
    params.require(:check).permit %i(height body_weight sitting_height naked_eyesight corrected_eyesight hearing urine electro_cardiogram nutritional_status user_student_id )
  end
end
