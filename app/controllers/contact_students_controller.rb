class ContactStudentsController < ApplicationController
  before_action :set_contact_student, only: %i(show edit update destroy)
  before_action :authenticate_user_student!

  def index
    @contact_students = ContactStudent.all
  end

  def new
    @contact_student = current_user_student.contact_students.build
  end

  def create
    @contact_student = current_user_student.contact_students.build(contact_student_params)
    if @contact_student.save
      redirect_to contact_students_path, notice: "Successfully saved."
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @contact_student.update(contact_student_params)
      redirect_to contact_students_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact_student.destroy
    redirect_to contact_students_path, notice: 'Successfully destroyed.'
  end

  private

  def set_contact_student
    @contact_student = ContactStudent.find(params[:id])
  end

  def contact_student_params
    params.require(:contact_student).permit %i(title content image)
  end
end
