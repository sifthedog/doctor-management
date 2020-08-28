# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @doctors = Doctor.all
  end

  def show
    @patient = Patient.find(params[:id])
    @doctors = Doctor.all
  end

  def update
    result = UpdatePatient.call(patient_params: patient_params, patient_id: params[:id])

    if result.success?
      redirect_to patients_path, notice: 'Paciente atualizado com sucesso!'
    else
      redirect_to patient_path, alert: result.error
    end
  end

  def create
    result = CreatePatient.call(patient_params: patient_params)

    if result.success?
      redirect_to patients_path, notice: 'Paciente criado com sucesso!'
    else
      redirect_to new_patient_path, alert: result.error
    end
  end

  def destroy
    Patient.find(params[:id]).destroy

    redirect_to patients_path, notice: 'Paciente removido com sucesso!'
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :cpf, :birth_date).merge!(doctor_id: params[:doctor_id])
  end
end
