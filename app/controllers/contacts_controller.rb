class ContactsController < ApplicationController
  before_action :set_contact, only: %i(show edit update destroy)
  before_action :authenticate_user_student!

  def index
    @contacts = Contact.all
  end

  def new
    @contact = current_user_student.contacts.build
  end

  def create
    @contact = current_user_student.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Successfully saved."
    else
      render :new
    end
  end

  def show; end

  def show
    @student_comments = @contact.student_comments
    @student_comment = @contact.student_comments.build
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

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit %i(title content image)
  end
end
