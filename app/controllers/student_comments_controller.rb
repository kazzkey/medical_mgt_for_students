class StudentCommentsController < ApplicationController
before_action :set_contact_student, only: [:create, :edit, :update]
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @student_comment = @contact_student.student_comments.build(student_comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @student_comment.save
        format.js { render :index }
      else
        format.html { redirect_to contact_student_path(@contact_student), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @student_comment = @contact_student.student_comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  def update
    @student_comment = @contact_student.student_comments.find(params[:id])
      respond_to do |format|
        if @student_comment.update(student_comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @student_comment = Student_comment.find(params[:id])
    @student_comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  # ストロングパラメーター
  def student_comment_params
    params.require(:student_comment).permit(:contact_student_id, :content, :comment_image)
  end

  def set_contact_student
    @contact_student = ContactStudent.find(params[:contact_student_id])
  end
end
