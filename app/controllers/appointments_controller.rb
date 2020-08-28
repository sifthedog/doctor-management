# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all.order('starts_at')
  end
  def new
    @patients = Patient.all
    @doctors = Doctor.all
  end
  def create
    result = CreateAppointment.call(appointments_params: appointments_params)

    if result.success?
      redirect_to appointments_path, notice: 'Consulta marcada com sucesso!'
    else
      redirect_to new_appointment_path, alert: result.error
    end
  end
  def destroy
    result = DeleteAppointment.call(id: params[:id])

    if result.success?
      redirect_to appointments_path, notice: 'Consulta desmarcada com sucesso!'
    else
      redirect_to appointments_path, alert: result.error
    end
  end
  def show
    @patients = Patient.all
    @doctors = Doctor.all
    @appointment = Appointment.find(params[:id])
  end
  
  private

  def appointments_params
    params.require(:appointment)
      .permit(:starts_at)
      .merge!(
        doctor_id: params[:doctor_id], 
        patient_id: params[:patient_id]
      )
  end
  
end
