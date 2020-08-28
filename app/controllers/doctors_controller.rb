# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    result = UpdateDoctor.call(doctor_params: doctor_params, id: params[:id])

    if result.success?
      redirect_to doctors_path, notice: 'Médico editado com sucesso!'
    else
      redirect_to :doctor, alert: 'Já existe um médico cadastrado com este CRM.'
    end
  end

  def create
    result = CreateDoctor.call(doctor_params: doctor_params)

    if result.success?
      redirect_to doctors_path, notice: 'Médico criado com sucesso!'
    else
      redirect_to new_doctor_path, alert: 'Já existe um médico cadastrado com este CRM.'
    end
  end

  def destroy
    result = DeleteDoctor.call(id: params[:id])

    if result.success?
      redirect_to doctors_path, notice: 'Médico removido com sucesso!'
    else
      redirect_to doctors_path, alert: result.error
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :crm, :crm_uf).merge!(crm_uf: params[:crm_uf])
  end
end
