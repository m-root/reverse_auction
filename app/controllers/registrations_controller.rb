class RegistrationsController < Devise::RegistrationsController

  def index
  end

  def new
  end

  def create
    if (params[:patient])
      @patient = Patient.new(params[:patient])
      @patient.save
    else
      @doctor = Doctor.new(params[:doctor])
      @doctor.save
    end
    redirect_to root_path
  end
end
