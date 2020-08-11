class ContactsController < ApplicationController
  before_action :set_contact, only: %i(show edit update destroy)

  def index
    @contacts = Contact.all
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
    # @comments = @contact.comments
    # @comment = @contact.comments.build
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
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit %i(title content image)
  end
end
