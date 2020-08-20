class ContactsController < ApplicationController
  before_action :set_contact, only: %i(show edit update destroy)

  def index
    if current_user_officer && current_user_officer.type == '医師'
      @q = Contact.where(release: true).page(params[:page]).per(10).ransack(params[:q])
    else
      @q = Contact.page(params[:page]).per(10).ransack(params[:q])
    end
    @contacts = @q.result(distinct: true).includes(:user_student, :user_officer)
  end

  def new
    @contact = current_user_student_or_user_officer.contacts.build
  end

  def create
    @contact = current_user_student_or_user_officer.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Successfully saved."
    else
      render :new
    end
  end


  def show
    @comments = @contact.comments
    @comment = current_user_student_or_user_officer.comments.build
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: 'Successfully destroyed.'
  end

  private

  def current_user_student_or_user_officer
    current_user_student || current_user_officer
  end

  def set_contact
    if current_user_officer && current_user_officer.type == '医師'
      @contact = Contact.where(release: true).find(params[:id])
    else
      @contact = Contact.find(params[:id])
    end
  end

  def contact_params
    params.require(:contact).permit %i(title content image release)
  end
end
