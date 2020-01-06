class PatientsController < ApplicationController
  before_action :authenticate_user!, :find_patient, only: :show
  before_action :find_patient, only: %i(show edit update)

  load_and_authorize_resource
  skip_authorize_resource only: %i(new create)

  def show; end

  private

  def find_patient
    return if @patient = Patient.find_by(id: params[:id])

    flash[:danger] = t "not_found"
    redirect_to root_url
  end
end
