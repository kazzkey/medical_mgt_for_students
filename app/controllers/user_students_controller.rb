class UserStudentsController < ApplicationController
  def show
    @user_student = current_user_student
    @contacts = Contact.where(user_student_id: @user_student.id).all
    @user_student = UserStudent.find(params[:id])
    unless @user_student == current_user_student
      redirect_to homes_path, notice: '他の人のプロフィール画面へはアクセスが出来ません。'
    end
  end
end
