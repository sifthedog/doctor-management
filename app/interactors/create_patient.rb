# frozen_string_literal: true

class CreatePatient
  include Interactor

  before do
    cpf = context.patient_params[:cpf]
    validate_cpf = ValidateCpf.call(cpf: cpf)

    context.fail!(error: validate_cpf.error) unless validate_cpf.success?
  end

  def call
    patient = Patient.create(context.patient_params)

    context.fail!(error: 'Já existe um paciente com este CPF.') unless patient.valid?
  end
end
