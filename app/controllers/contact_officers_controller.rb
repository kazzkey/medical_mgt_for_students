class ContactOfficersController < ApplicationController
  before_action :set_contact_officer, only: %i(show edit update destroy)
  before_action :authenticate_user_officer!

  def index
    @contact_officers = ContactOfficer.all
  end

  def new
    @contact_officer = current_user_officer.contact_officers.build
  end

  def create
    @contact_officer = current_user_officer.contact_officers.build(contact_officer_params)
    if @contact_officer.save
      redirect_to contact_officers_path, notice: "Successfully saved."
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @contact_officer.update(contact_officer_params)
      redirect_to contact_officers_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact_officer.destroy
    redirect_to contact_officers_path, notice: 'Successfully destroyed.'
  end

  private

  def set_contact_officer
    @contact_officer = ContactOfficer.find(params[:id])
  end

  def contact_officer_params
    params.require(:contact_officer).permit %i(title content image)
  end
end
